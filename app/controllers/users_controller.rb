class UsersController < ApplicationController
	before_action :authenticate_user!
 

	def show
     @user = User.find(session[:user_id])

	end
	def edit
      @user = User.find(session[:user_id])
 	end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user

    flash[:alert] = "You need to login again"
       reset_session
    else
      render :edit, status: :unprocessable_entity
    end
 
  end




  def user_params
    params.require(:user).permit(:username, :email)
  end
end
