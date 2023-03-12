class BooksController < ApplicationController

before_action :correct_user, only:[:edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
      flash[:notice] = "You have created book successfully."
  　 　 redirect_to book_path(@book.id)
  　 else
 　    @user = current_user
      @books = @user.books
      render :index
     end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
     @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, alert: 'Destroy'
  end

  def update
  @book = Book.find(params[:id])
    if  @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
     redirect_to book_path(@book.id)
    else
     render :edit
    end
  end

  private

   def book_params
    params.require(:book).permit(:title, :body)
   end

  def correct_user
   @book = Book.find(params[:id])
   @user = @book.user
   redirect_to(books_path) unless @user == current_user
  end

end
