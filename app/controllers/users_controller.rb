class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end

  def destroy
   session.delete(:user_id)
   @current_user = nil
   redirect_to root_url
  end

end
