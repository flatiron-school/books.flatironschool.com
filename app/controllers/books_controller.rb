class BooksController < ApplicationController
  before_action :logged_in?
  before_action :is_admin?, only: [:new, :create, :update, :edit, :delete]
 
  def index
    @books = Book.with_complete_types.order(:created_at => :desc)
  end

  def new
    @book = Book.new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    @book = Book.create_with_type(book_params, @type)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    params[:page] ||= 1
    
    @book = Book.friendly.find(params[:id])
    if request.path != book_path(@book)
      redirect_to @book, status: :moved_permanently
    end
  end

  def destroy
    @book = Book.friendly.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.friendly.find(params[:id])
    if params[:type]
      @type = Type.new(type_params)
      @book.add_type(@type)
    end
    @book.update(book_params)
    if @book.save
      redirect_to edit_book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.friendly.find(params[:id])
    @type = Type.new
  end

  def sort
    @books = Book.get_all_with_tags(params[:tags])
    if @books.empty?
      @books = Book.all
    end
    respond_to do |f|
      f.js
    end
  end

  def search
    if params[:title]
      @books = Book.find_by(:id => params[:title][0])
      if @books.nil?
        @books = "It doesn't look like we have that one"
      end
    else
      @books = Book.all
    end
    respond_to do |f|
      f.js
    end
  end

  def download
    @book = Book.friendly.find(params[:id])
    @format = params[:type]
    @files = @book.types.where(:format => @format)
    unless current_user.books.include?(@book)
      current_user.user_books.build(:book => @book, :format => @format)
      current_user.save
    end
    respond_to do |f|
      f.js
    end
  end

  private
    def type_params
      params.require(:type).permit(:file)
    end

    def book_params
      params.require(:book).permit(:title, :author, :tags => [])
    end
end
