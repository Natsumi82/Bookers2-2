class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only:[:edit, :update]

  def index
   @users = User.all
   @book = Book.new
   @user = User.find(current_user.id)
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

   if @user.save
    flash[:success] = 'Welcome! You have signed up successfully.'
    redirect_to login_path
   else
    flash.now[:danger] = "errors prohibited this obj from being saved:"
    render :new
   end
  end


  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
        redirect_to user_path(current_user)
    end
  end


  def update
   book = User.find(params[:id])
   book.update(user_params)
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end


private

 def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
 end

 def correct_user
  @user = User.find(params[:id])
  unless @user == current_user
   redirect_to user_path(current_user)
  end
 end
end