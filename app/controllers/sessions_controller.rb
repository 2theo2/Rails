class SessionsController < ApplicationController
  def create
  	user = User.find_by(email:(params[:email]))
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to '/songs'
  	else
  		flash[:danger] = "There was a problem logging in."
  		redirect_to ''
  	end
  end

  def destroy
  	session.delete(:user_id)
  	@current_user = nil
  	redirect_to ''
  end
end
