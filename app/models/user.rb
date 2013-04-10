class User
	include Mongoid::Document
	include ActiveModel::SecurePassword

	field :username, type: String
	field :email, type:String
	field :password, type: String
	field :password_confirmation


	validates :username, :length => {:in => 6..20},
											 :presence => true
	validates :email, :presence => true


end