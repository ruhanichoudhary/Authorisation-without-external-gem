class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

helper_method :current_user  #to make it available to all the controllers!

private 

def sign_in(user)
	session[:user_id] = user.id if user.present?
end

def sign_out
	session[:user_id] = nil
end

def current_user
	User.find_by id: session[:user_id] if session[:user_id]
end
end
