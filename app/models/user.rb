class User < ActiveRecord::Base
	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false},
	email: true

	validates_presence_of :password
	has_secure_password

	has_many :post

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end

end
