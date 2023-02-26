class UsersController < ApplicationController
  def index
   @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to users_path
  end

  def update
   book = User.find(params[:id])
   book.update(user_params)
   radirect_to user_path(user.id)
  end
  
private

 def user_params
    params.require(:book).permit(:title, :body, :image)
    params.require(:user).permit(:name, :introduction, :image)  end
end
