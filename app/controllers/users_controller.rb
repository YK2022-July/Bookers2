class UsersController < ApplicationController

  def index
    #@user = User.find(params[:id])
    @users = User.all
    #@book = Book.find(params[:id])
  end

  def show
    @books_current = Book.where(user_id: current_user.id)
    @books_other = Book.where(user_id: User)
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
