class User < ApplicationRecord
	has_many :jobs_users, dependent: :destroy

	attr_accessor :password
	before_save :add_salt_and_hash

	validates :name, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, on: :create,length: { minimum: 5 },confirmation: true
	validates_date :age, :before => lambda { 18.years.ago },
						 :before_message => "must be at least 18 years old"

	# include Humanizer
	# require_human_on :create

	# before_create :add_activation_token
	# def add_activation_token
	#     # self.activation_token = SecureRandom.urlsafe_base64
	#     self.activation_token = ""
	#     self.activation_status = "active"
	# end

	def add_salt_and_hash
		unless password.blank?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
		end
	end
end
