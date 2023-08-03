	class User < ApplicationRecord
		before_save { self.email = email.downcase }
		has_many :articles, dependent: :destroy

		validates :user_name, presence: true, length: {in: 4..30}
		VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
		validates :email, presence: true, uniqueness: true, 
											length: {maximum: 30}, format: {with: VALID_EMAIL_REGEX}
		validates :password, presence: true

		has_secure_password

	end