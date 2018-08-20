class AddsController < ApplicationController
  def create
  	@song = Song.find(params[:id])

  	@newadd = Add.create(user_id: current_user.id, song_id: @song.id)
	if @song.valid?
  		puts "Added Adds"
  		redirect_to '/songs'
  	else
  		flash[:danger] = @user.errors.full_messages
  		redirect_to '/songs'
  	end
  end

  def show
  end

  def index
  end
  def add_params
  	params.merge(user_id: current_user.id, song_id: @song.id)
  end
end
