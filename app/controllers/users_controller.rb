class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :ensure_correct_user, only:[:edit, :show]

  def index
   @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def new
    @book = Book.new
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
    redirect_to book_path(@book)
   else
    render :index
   end
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
   book = User.find(params[:id])
   book.update(user_params)
   if @user.update(user_params)
     flash[:notice] = "You have updated user successfully"
     radirect_to user_path(@user)
   else
    render :edit
   end
  end


private

 def user_params
  params.require(:user).permit(:name, :introduction, :profile_image_id)
 end

 def ensure_correct_user
  @user = User.find(para,s[:id])
  unless @user == current_user
   redirect_to user_path(current_user.id)
  end
 end
end