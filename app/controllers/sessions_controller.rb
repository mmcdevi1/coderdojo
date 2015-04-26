class SessionsController < ApplicationController

	def new 
    redirect_to root_path if current_user
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to root_path
      flash[:success] = "You are signed in, enjoy!"
    else
      flash[:danger] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:success] = "You have been logged out."
  end

end
