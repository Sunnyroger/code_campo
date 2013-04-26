class UsersController < ApplicationController
	before_filter :need_signed_in, only: [:show,:edit,:update,:delete]
	before_filter :correct_user, only: []

	def index
		@users = User.page params[:page]
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
		@user = User.find(params[:id])
	end

	def update
		
	end

	def delete
		
	end

	private
		def need_signed_in
			unless login? 
				store_location
				redirect_to signin_path, notice: "Please sign in !" 
			end
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to root_path unless current_user?(@user)
		end

end