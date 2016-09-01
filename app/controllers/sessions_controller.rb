class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{current_user.username}"
      redirect_to dashboard_path
    else
      flash[:warning] = "Authentication Failed. Please try again, or <a href='/newuser'>Sign Up</a> for an account.".html_safe
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to "/"
  end

end
