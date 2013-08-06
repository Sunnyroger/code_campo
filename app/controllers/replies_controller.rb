# encoding: utf-8

class RepliesController < ApplicationController
	before_filter :need_signed_in
	before_filter :find_topic, only: [:new, :create]

	def new
		@reply = current_user.replies.new :topic => @topic
	end

	def create 
		@reply = current_user.replies.new params[:reply]
		@reply.topic = @topic
		respond_to do |format|
			if @reply.save
				format.html{ redirect_to @topic, notice: "回复成功"}
				format.js{ render layout: false	 }
			else
				format.html { render :new }
      	format.js { render :layout => false, :status => 406  }
			end
		end
	end

	def edit
		@reply
	end

	def update
		
	end

	def destroy
		@reply = Reply.find(params[:id])
		if @reply.destroy
			redirect_to topic_path(@reply.topic_id), notice: "删除成功！"
		else
			redirect_to topic_path(@reply.topic_id), notice: "对不起，删除失败了,请稍候重试！"
		end
	end

	protected
		def find_topic
			@topic = Topic.find(params[:topic_id])
		end
end