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
   session.delete(:user_id)
   @current_user = nil
   redirect_to root_url
  end

private
 def user_params
    params.require(:user).permit(:name, :introduction, :image)  end
end
