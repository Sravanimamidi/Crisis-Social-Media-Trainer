class SessionsController < ApplicationController
  def new
end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Logged in!"
  else
	flash.now[:error] = 'Unknown user. Please check your username and password.'
	#redirect_to root_url, :notice => "Logged in!"
	render "new"
	#flash[:notice] = 'Invalid email or password'
  #  flash.now.alert = "Invalid email or password"
    
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
end
end
