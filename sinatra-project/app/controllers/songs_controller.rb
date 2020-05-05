class SongsController < ApplicationController
  
  
  get '/songs/index' do 
    erb :"songs/index"
  end 
  

  get '/songs/new' do 
    erb :'songs/new'
  end 
  
  
  post '/songs' do 
    @song = Song.new(params)
    if @song.save
      erb :'songs/show'
    else 
      erb :'songs/new'
    end 
  end 
  
  
  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end 
  
  get '/songs/:id/edit' do 
  
  end 
  
  patch '/songs/:id' do 
    
  end 
  
  delete '/songs/:id/delete' do 
    
  end 
  
  
  
end 