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

  def attach_metadata
    content = open(Rails.root.join(file.file.file))
    format = self.assign_format
    if format == "PDF"
      reader = PDF::Reader.new(content)
      info = reader.info
      book_title = info[:Title]
      book_author = info[:Author]
      img_path = Rails.root.join(file.file.file).to_s[0..-1] + "[0]"
      cover = Magick::Image.read(img_path)
      book_cover = cover[0]
      #todo - book_cover currently not functional
    elsif format == "MOBI"
      reader = Mobi::Metadata.new(content)
      book_author = reader.author
      book_title = reader.title
    elsif format == "EPUB"
      reader = EPUBInfo.get(content)
      book_author = reader.creators.first.name
      book_title = reader.titles.first
      book_cover = File.open(reader.cover.tempfile.path) if reader.cover.tempfile
    end
    begin
    book_title = book_title.gsub(/\(([^\)]+)\)/, "").split(",")[0].strip
    book = Book.find_or_initialize_by(title: encode_utf8(book_title))
    book.author = encode_utf8(book_author)
    self.incomplete = false
    rescue
      book = Book.find_or_initialize_by(title: file.filename)
      self.incomplete = true
    end
    book.cover = book_cover if book_cover
    add_filename_to_types
    case format 
    when "PDF"
      book.pdf = true
    when "MOBI"
      book.mobi = true
    when "EPUB"
      book.epub = true 
    end   
    book.types << self
    book.save
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
