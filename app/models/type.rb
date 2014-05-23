class Type < ActiveRecord::Base

  belongs_to :book
  mount_uploader :file, FileUploader
  before_create :validate_uniqueness_of_filename

  def self.incomplete
    all.where(incomplete: true)
  end

  def add_filename_to_types
    self.filename = file.filename
  end

  def validate_uniqueness_of_filename
    !self.class.all.map {|i| i.filename}.include? self.filename
  end

  def pdf_processing(content)
    reader = PDF::Reader.new(content)
    title = reader.info[:Title]
    temp_cover_path = "#{Rails.root}/tmp/#{title}-cover.png"
    img_path = Rails.root.join(file.file.file).to_s[0..-1] + "[0]"
    cover = Magick::Image.read(img_path)
    file = cover[0].write(temp_cover_path)
    { :author => reader.info[:Author], 
      :title => title, 
      :cover => File.open(temp_cover_path),
      :temp_path => temp_cover_path}
  end

  def mobi_processing(content)
    reader = Mobi::Metadata.new(content)
    { :author => reader.author, 
      :title => reader.title, 
      :cover => nil,
      :temp_path => nil }
  end

  def epub_processing(content)
    reader = EPUBInfo.get(content)
    reader.cover.tempfile ? cover = File.open(reader.cover.tempfile.path) : cover = nil
    { :author => reader.creators.first.name,
      :title => reader.titles.first,
      :cover => cover, 
      :temp_path => nil }
  end

  def approved_type?(format)
    format == "PDF" || format == "MOBI" ||  format == "EPUB" ? true : false
  end

  def attach_metadata
    book_info = {}
    content = open(Rails.root.join(file.file.file))
    format = self.assign_format
    book_info = send(format.downcase + "_processing", content) if approved_type?(format)
    begin
      title = book_info[:title].gsub(/\(([^\)]+)\)/, "").split(",")[0].strip
      book = Book.find_or_initialize_by(title: encode_utf8(title))
      book.author = encode_utf8(book_info[:author]) if book_info[:author]
      book.cover = book_info[:cover] if book_info[:cover]
      self.incomplete = false
    rescue
      book = Book.find_or_initialize_by(title: file.filename)
      self.incomplete = true
    end
    add_filename_to_types
    book.send("#{(format.downcase).to_sym}=", true) if approved_type?(format)
    book.types << self
    book.save
    FileUtils.rm(book_info[:temp_path]) if book_info[:temp_path]
  end

  def encode_utf8(text)
    text.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
  end

  def unzip
    Zip::File.open(self.file.file.file) do |zip_file|
      zip_file.each do |book_file|
        book_name = book_file.name
        path = Rails.root.join("public/uploads/zips/#{book_name}")
        book_file.extract(path)
        file = open(path)
        type = self.class.new(file: file)
        type.attach_metadata
        File.delete(path)
      end
    end
  end

  def assign_format
    type = self.file.content_type
    if type.include? "epub+zip"
      self.format = "EPUB"
    elsif type.include? "pdf"
      self.format = "PDF"
    elsif type.include? "octet-stream"
      self.format = "MOBI"
    elsif type.include? "zip"
      unzip
    end
  end

end
