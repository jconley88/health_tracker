class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:email, :password, :password_confirmation)
    if @user.save
      redirect_to root_url, notice: "Welcome to Health Tracker!"
    else
      render 'new', status: 422
    end
  end
end