class UsersController < ApplicationController
	def index
		@users = User.all.page params[:page]
		binding.pry
	end
	
	def new
		@user = User.new
	end

	def show

		@user = User.find(params[:id])
			 		binding.pry
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome to CodeCampo!"
			login_as @user
			redirect_to root_url
		else
			render :new
		end
	end

end