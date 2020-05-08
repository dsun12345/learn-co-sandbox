class SessionsController < ApplicationController	

  get '/login' do 	
      erb :'users/login'	
  end 	

  post '/login' do	
    @user = User.find_by(email: params[:email])	
    if @user && @user.authenticate(params[:password])	
      session[:user_id] = @user.id
      redirect to '/songs'	
    else 	
      erb :'users/login'	
    end 	
  end 	

end  