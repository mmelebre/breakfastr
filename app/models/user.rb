class User < ActiveRecord::Base
	has_secure_password
	# is_admin :boolean
	has_many :pastries
	has_many :orders

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true
	validates :
end
