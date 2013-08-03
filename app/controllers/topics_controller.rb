# encoding: utf-8
class TopicsController < ApplicationController

	before_filter :need_signed_in, :except => [:index]

	def index
		@topics = Topic.order_by([[:active_time, :desc]]).page params[:page]
	end

	def show
		@topic = Topic.find(params[:id])
		@reply = current_user.replies.new :topic => @topic
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
			render :new
		end
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic=Topic.find(params[:id])
		if @topic.update_attributes(params[:topic])
			redirect_to @topic
			flash[:success] = "更新成功!"
		else
			flash[:error] = "失败啦!"
			render :edit
		end
	end

	def destroy
		@topic = Topic.find(params[:id])
		if @topic.destroy
			flash[:notice]="删除成功"
			redirect_to :action => :index
		else 
			flash[:error]="呀，删除失败！"
		end
	end

	protected


end