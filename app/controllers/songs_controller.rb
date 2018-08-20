class SongsController < ApplicationController
  def new
  end

  def show
  	@user = User.find(session[:user_id])
  	@song = Song.find(params[:id])
  	@otheruser = User.where.not(id: session[:user_id])
  	@adds = Add.where(song_id: params[:id])
  end

  def create
  	@user = User.find(session[:user_id])
  	@newsong = Song.create(songs_params)
  	if @newsong.valid?
  		redirect_to '/songs'
  	else
  		flash[:danger] = @newsong.errors.full_messages
  		redirect_to '/songs'
  	end
  end

  def index
  	@user=User.find(session[:user_id])
  	@songs=Song.all
  end

  def songs_params
  	params.require(:song).permit(:title, :artist).merge(user: current_user)
  end
end
