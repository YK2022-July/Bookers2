class UsersController < ApplicationController

  def index
    #@user = User.find(params[:id])
    @users = User.all
    @book = Book.new
  end

  def show
    @books_current = Book.where(user_id: current_user.id)
    @books_other = Book.all.where(user_id: User)
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
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
