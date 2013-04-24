class UsersController < ApplicationController

	def index
		@users = User.all.page params[:page]
	end
	
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
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

	def edit
		
	end

	def update
		
	end

	private
		def signed_in_user
			redirect_to signin_path, notice: "Please sign in !" if not login?  
		end

end