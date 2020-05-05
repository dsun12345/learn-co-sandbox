class UsersController < ApplicationController
  
  get '/users/:id' do 
    @user = User.find(params[:id])
    erb :'users/show'
  end 
  
  get '/sign_up' do 
    erb :'/users/signup'
  end 
  
  post '/sign_up' do 
    @user = User.new(params)
    if @user.save && params[:password].length >= 4
      session[:user_id] = @user.id
      redirect to '/songs'
    else 
      erb :'users/new'
    end 
  end 

  get '/logout' do 
    if session.destroy 
      redirect to '/'
    else
      redirect to '/songs'
    end 
  end 
  
  delete '/users/deactivate' do 
        
  end 
  
  
end 