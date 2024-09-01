class UsersController < ApplicationController
	before_action :authenticate_user!
	def new
	end
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end


	private

  def user_params
      params.require(:user).permit(:username, :email)
  end
end
