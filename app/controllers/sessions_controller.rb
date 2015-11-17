class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate login_params["email"], login_params["password"]

  	if user
  		session[:user_id] = user.id
  		flash[:success] = "#{user.name} has logged in"
  		redirect_to login_path
  	else
  		flash[:danger] = "You have the wrong email/password"
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
    flash[:danger] = "You logged out"
  	redirect_to login_path
  end

  private
  	def login_params
  		params.require(:user).permit(:email, :password)
  	end

end
