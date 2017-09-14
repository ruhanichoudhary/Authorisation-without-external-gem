class SessionsController < ApplicationController
  

  def new
  end

  def create 
  	user = User.find_by email: params[:email].downcase

  	if user && user.authenticate(params[:password])
  	  sign_in user
      flash[:notice] = "You are now signed in!"
      redirect_to root_path
  	else
  		flash.now[:alert] = "invalid email/password"
  		render 'new'
  	end
  end

  def destroy
    sign_out
    flash[:notice] = "You are now signed out!"

    redirect_to root_path
  end
end
