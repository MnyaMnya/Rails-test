class SessionsController < ApplicationController

	def new

	end

	def create
		if user = User.authenticate_by(email: params[:email],password:params[:password])
			login user
			redirect_to root_path, notice: "You have signed succesfully"
		else
			flash[:alert] = "Invalid email or password"
		end
	end

	def destroy
		logout current_user
		redirect_to root_path, notice: "You Have been logged out"
	end



end