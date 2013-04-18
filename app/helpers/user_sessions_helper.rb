module UserSessionsHelper
	def login_as(user)
		session[:user_id] = user.id
		self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end
	
	def login?
		!current_user.nil?
	end

  def current_user
    @current_user ||= login_from_session unless @current_user
  end 

  def login_from_session
  	if session[:user_id].present?
  		begin
  			User.find session[:user_id]
  		rescue
  			session[:user_id] = nil
  		end
  	end
  end

  def logout
  	session[:user_id] = nil
  	self.current_user = nil
  end

end
