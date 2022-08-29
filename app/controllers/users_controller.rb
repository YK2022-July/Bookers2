class UsersController < ApplicationController

  def index
    #@user = User.find(params[:id])
    @users = User.all
    @book = Book.new
  end

  def show
    @books_current = Book.where(user_id: current_user.id)
    @user = User.find(params[:id])
    @books_other = Book.where(user_id: @user)
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    unless user_signed_in? && (current_user == @user)
      redirect_to user_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
