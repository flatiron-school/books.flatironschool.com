class UsersController < ApplicationController

  def books
    if params[:sort_by] === "book"
      @users = User.get_by_books(params[:book_ids])
    else 
      @books = Book.get_by_user(params[:user_ids])  
    end  
    respond_to do |f|
      f.js
    end
  end
end
