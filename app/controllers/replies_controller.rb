# encoding: utf-8
class RepliesController < ApplicationController
	before_filter :need_signed_in
	before_filter :find_topic, only: [:new, :create]

	def new
		binding.pry
		@reply = current_user.replies.new :topic => @topic
	end

	def create 
		@reply = current_user.replies.new params[:reply]
		@reply.topic = @topic
		if @reply.save
			flash[:success] = "回复成功！"
			redirect_to @topic
		else
			render :new
		end
	end

	def edit
		@reply
	end

	def update
		
	end

	def destroy
		
	end

	protected
		def find_topic
			@topic = Topic.find(params[:topic_id])
		end

end