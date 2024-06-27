class BooksController < ApplicationController
  def new
    @books=Book.new
  end
  
  def create
    @books = Book.new(books_params)
    @books.user_id = current_user.id
    @books.save
    redirect_to books_path
  end

  def index
    @books=Book.all
  end

  def show
    @books=Book.find(params[:id])
  end

  def edit
  end
  
  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path(params[:id])
  end
  
  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
end
