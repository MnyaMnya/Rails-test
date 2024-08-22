class Article < ApplicationRecord
	include Visible
	has_many :comments, dependent: :destroy

	validates :owner, presence: true
	validates :title, presence: true, length: { maximum: 10 }
 	validates :body, presence: true, length: { minimum: 10 }


end
