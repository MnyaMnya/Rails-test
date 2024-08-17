class ApplicationController < ActionController::Base
before_action :set_current_user, if: :user_signed_in?	
	private

	def authenticate_user!
		redirect_to root_path, alert: "You must be logged in to do that" unless user_signed_in?
	end
	def set_current_user
		Current.user = current_user
	end

	def current_user
		Current.user ||= authenticate_user_from_session
	end

	helper_method :current_user

	def authenticate_user_from_session
		User.find_by(id: session[:user_id])
	end	

	def user_signed_in?
		current_user.present?
	end

	helper_method :user_signed_in?



	def login(user)
		Current.user = user
		reset_session
		session[:user_id] = user.id
		session[:username] = user.username
	end

	def logout(user)
		Current.user = nil
		reset_session
	end

end
