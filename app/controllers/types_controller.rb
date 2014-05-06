class TypesController < ApplicationController

  def new
    @type = Type.new
  end

  def create
    unless file_exists?
      @type = Type.new(file: params[:type][:file])
      @type.attach_metadata
      @book = @type.book
      @type.save
      @new = true
    else
      @new = false
      @type = Type.find_by(:filename => params[:type][:file].original_filename)
      @book = @type.book
    end
    respond_to do |f|
      f.js
    end
  end

  def show
    @book = Book.find(params[:book_id])
    @type = Type.find(params[:id])
    unless current_user.books.include?(@book)
      current_user.user_books.build(:book => @book, :format => @type.format)
      current_user.save
    end
    respond_to do |f|
      f.js
    end
  end

  def index
    @books = Book.with_complete_types
    @incomplete_types = Type.incomplete
  end

  def edit
    @incomplete_types = Type.incomplete
  end

  def update
    @type = Type.find(params[:id])
    @type.update(book_id: params[:title], incomplete: false)
    if @type.save
      respond_to do |f|
        f.js
      end
    end
  end

  private
  def type_params
    params[:type][:file]
  end

  def file_exists?
    !!(!Type.where(:filename => params[:type][:file].original_filename).empty?)
  end

end
