class UsersController < ApplicationController

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    flash[:success] = "Welcome, #{@user.username}"
    session[:user_id] = @user.id
    redirect_to dashboard_path
  else
    formatted_errors = @user.errors.full_messages.uniq.map { |m| m.downcase.capitalize }.join(" - ")
    flash[:warning] =  formatted_errors + " - Please try again."
    render :new
  end
end

def show
  redirect_to '/' if !current_user
end

private

def user_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation)
end

end