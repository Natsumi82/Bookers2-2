class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id =current_user.id
     if @book.save
     redirect_to books_path
     else
      render :new
     end
  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit
     @book = Book.find(params[:id])
  end

  def destroy
  end

  def update
   book = Book.find(params[:id])
   book.update(book_params)
   radirect_to book_path(book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
