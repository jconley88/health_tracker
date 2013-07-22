class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged In!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new, status: :unauthorized
    end
  end
end
