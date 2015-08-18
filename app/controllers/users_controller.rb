class UsersController < ApplicationController
  def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect_to root_url, :notice => "Signed up!"
  else
    flash.now[:notice] = 'Please enter vaild details'
    render "new"
  end
end

 private

  def user_params
    params.require(:user).permit(:email, :password, :password_salt)
  end
end
