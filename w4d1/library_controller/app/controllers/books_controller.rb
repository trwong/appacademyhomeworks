class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
  end

  def new
    # your code here
  end

  def create
    # your code here
    Book.create(book_params)
    redirect_to books_url
  end

  def destroy
    your code here
    id = Book.find(params[:id])
    Book.delete(id)
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
