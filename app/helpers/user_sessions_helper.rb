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
    @current_user ||= login_from_session
  end

  def current_user?(user)
    user == current_user
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

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def store_location
    session[:return_to] = request.fullpath
  end

end
