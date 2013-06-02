class User
	include Mongoid::Document
	include ActiveModel::SecurePassword

	attr_accessible :username, :email, :password, :password_confirmation

	field :username
	field :email
	field :password_digest

	has_many :topics

	before_save { |woca| woca.email =  email.downcase }
	has_secure_password

	validates :username, :length => {:in => 4..20},
											 :presence => true,
											 :uniqueness => true
	validates :email, :presence => true, :uniqueness => {:case_sensitive => false}
	validates :password, :presence => true,
											 :length => {:in => 6..20}
	validates :password_confirmation, :presence => true, :on => :create

end