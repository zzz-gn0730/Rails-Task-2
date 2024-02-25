class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @room = Room.new
  end

  def profile
    @profile_user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar, :bio)
  end
end
