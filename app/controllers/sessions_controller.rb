class SessionsController < ApplicationController
  layout 'login_register'
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect_to home_path
    else
        render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end
end