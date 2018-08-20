class UsersController < ApplicationController
  def index
  end
  def create
  	puts "Are We Trying to Create?"
  	@user = User.new(user_params)
  	puts @user
  	@user = User.create(user_params)
  	if @user.valid?
  		session[:user_id] = @user.id
  		puts "created user"
  		redirect_to '/songs'
  	else
  		flash[:danger] = @user.errors.full_messages
  		redirect_to '/'
  	end
  end
  def new
  end

  def show
  	@user = User.find(params[:id])
  	@adds = Add.where(user_id: params[:id])
  	@songs = Song.all
  end
  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
end
