class SessionsController < ApplicationController
  
  get '/login' do 
    if logged_in?
      erb :'users/login'
    end 
  end 
  
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      redirect to '/songs'
    else 
      erb :'users/login'
    end 
  end 
  
end 