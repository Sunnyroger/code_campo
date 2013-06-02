# encoding: utf-8
class TopicsController < ApplicationController

	before_filter :need_signed_in, :except => [:index]

	def index
		@topics = Topic.all
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = current_user.topics.new(params[:topic])
		if @topic.save
			flash[:success] = "创建成功"
			redirect_to topics_path
		else
			flash[:error] = "创建失败"
			render :new
		end
	end

	def edit
		
	end

	def update
		
	end

	def delete
		
	end

end