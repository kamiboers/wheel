class UsersController < ApplicationController

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    flash[:notice] = "Welcome to Wheel of Chorechun, #{@user.username}"
    redirect_to dashboard_path
  else
    flash[:notice] = "Welcome to Wheel of Chorechun, #{@user.username}"
    render :new
  end
end

private

def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation)
end

end