class SongsController < ApplicationController	


  get '/songs' do
    @user = current_user
    @songs = current_user.songs
    erb :"songs/index"	
  end 	


  get '/songs/new' do 	
    erb :'songs/new'	
  end 	


  post '/songs' do 	
    @song = Song.new(params)	
    @song.user = current_user 	
    if @song.save	
      redirect "/songs/#{@song.id}"	
    else 	
      erb :'songs/new'	
    end 	
  end 	

  get '/songs/:id' do	
    @song = Song.find_by_id(params[:id])
    if @song && @song.user.id == current_user.id
      erb :'songs/show'
    else 
      redirect to '/songs'
    end 
  end 	

  get '/songs/:id/edit' do 
    @song = Song.find_by_id(params[:id])
    if @song && @song.user.id == current_user.id
      erb :'songs/edit'	
    else 
      redirect to '/songs'
    end 
  end 	

  patch '/songs/:id' do 	
    @song = Song.find(params[:id])	
    @song_params = update_list(params)	
    @song.update(@song_params)	
    redirect to "songs/#{@song.id}"	
  end 	

  delete '/songs/:id/delete' do 	
    @song = Song.find(params[:id])	
    @song.destroy 	
    if @song.errors.messages.length <= 0 	
      redirect to '/songs'	
    else	
      erb :"songs/#{@song.id}"	
    end 	
  end 	

private	

  def update_list(params)	
    {	
      name: params[:name],	
      artist: params[:artist],	
      genre: params[:genre],	
      release_date: params[:release_date]	
    }	
  end 	


end  