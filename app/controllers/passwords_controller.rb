class PasswordsController < ApplicationController
	before_action :authenticate_user!

	def edit
	end

	def update
		if current_user.update(password_params)
			redirect_to edit_password_path, notice: "Your password has been updated succesfully"
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def password_params
		params.require(:user).permit(
			:password,
			:password_confirmation,
			:password_challenge
			).with_defaults(password_challenge:"")
	end
end