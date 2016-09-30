class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
  if  (User.exists?(user_id: params[:user][:user_id], email: params[:user][:email])) then
    @user = User.find_by(user_id: params[:user][:user_id], email: params[:user][:email] )
    session[:session_token] = @user.session_token 
     flash[:notice] = "You are logged in as #{params[:user][:user_id]}"
      redirect_to movies_path
  else
     flash[:notice] = "Invalid user-id/e-mail combination"
      redirect_to login_path
  end
end

  def destroy
    session[:session_token]=nil
    @user = nil
    redirect_to movies_path 
  end
end
