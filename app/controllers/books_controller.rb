class BooksController < ApplicationController
before_action :authenticate_user!
before_action :ensure_correct_user, only:[:edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
      flash[:notice] = "You have created book successfully."
  　 　 redirect_to book_path(@book)
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
    redirect_to books_path
  end

  def update
   @book = Book.find(params[:id])
   @book.user_id = current_user.id
     if @book.update(book_params)
       flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
      render :edit
     end
  end

  private

   def book_params
    params.require(:book).permit(:title, :body)
   end

   def ensure_correct_user
     @book = Book.find(params[:id])
     unless @book.user == current_user
       redirect_to books_path
     end
   end

end
