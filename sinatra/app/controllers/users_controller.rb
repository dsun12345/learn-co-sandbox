class UsersController < ApplicationController	

  get '/users/:id' do 	
    if logged_in?	
      @user = User.find(params[:id])	
      erb :'users/show'	
    end 	
  end 	

  get '/sign_up' do 	
    if logged_in?	
      redirect to 'songs'	
    else	
      erb :'/users/signup'	
    end 	
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
    if logged_in?	
      if session.clear 	
        redirect to '/'	
      else	
        redirect to '/songs'	
      end 	
    else	
      redirect '/songs'	
    end 	
  end 	

  delete '/users/:id/deactivate' do 	
    @user = User.find(params[:id])	
    @user.destroy 	
    if @user.errors.messages.length <= 0 	
      erb :"/welcome"	
    else	
      erb :"users/#{@user.id}"	
    end 	
  end 	


end  