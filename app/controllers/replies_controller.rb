# encoding: utf-8
class RepliesController < ApplicationController
	before_filter :need_signed_in

	def new
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
			flash.now[:error] = "添加失败！"
		end
	end

	def edit
		@reply
	end

	def update
		
	end

	def destroy
		
	end

end