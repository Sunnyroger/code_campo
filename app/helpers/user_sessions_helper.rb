module UserSessionsHelper
	def login_as(user)
		self.current_user= user
	end

	def current_user=(user)
		@current_user = user
	end
	
	def login?
		!@current_user.nil?
	end

  def current_user
    @current_user   
  end 

end
