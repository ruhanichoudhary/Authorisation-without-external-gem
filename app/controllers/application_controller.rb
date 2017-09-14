class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

helper_method :current_user , :current_user? #to make it available to all the controllers!

private 

def user_logged_in!
	return if current_user.present?    # will not redirect to login path after sign in
	flash[:alert] = "Please sign in to view that resource"
	redirect_to login_path
end

def sign_in(user)
	session[:user_id] = user.id if user.present?
end

def sign_out
	session[:user_id] = nil
end

def current_user
	@current_user ||= User.find_by id: session[:user_id] if session[:user_id] 
	# if current user is present then the User.find_by ...line will not execute because current user
	# is in the cache already...
	#if current user is not there then it will pluck the user from the record. this saves time
end

def current_user?
    current_user.present?
end 
end
