class UserSessionsController < ApplicationController
	def new
	end

	def create
	 	user = User.where(:username => params[:login]).first || User.where(:email => params[:login]).first
	 	if user && user.authenticate(params[:password])
	 		flash[:success] = "Successful signin"
	 		login_as user
	 		redirect_back_or root_path
	 	else
	 		flash.now[:error] = "Invalid email/username/password"
	 		render :new
	 	end
	end

	def destroy
		flash[:notice] = "Successful log out!"
	 	logout
	 	redirect_to root_path
	end

end