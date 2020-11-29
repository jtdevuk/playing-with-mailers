class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @user = User.last
    @book = Book.new(book_params)
    if @book.save
      NewBookMailer.notify_new_book(@user, @book).deliver
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @books = Book.all
  end

  private

  def book_params
    params.require(:book).permit()
  end
end


