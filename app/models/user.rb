class User < ApplicationRecord
	has_secure_password
  
  validates :username, uniqueness: { message: "Username Already Taken", case_sensitive: false }
	validates :email, presence: true, uniqueness: { message: "Email Already Used", case_sensitive: false }
	normalizes :email, with: -> (email) {email.strip.downcase}

	generates_token_for :password_reset, expires_in: 15.minutes do
		password_salt(10)
	end

	generates_token_for :email_confirmation, expires_in: 24.hours do
		email
	end
end

