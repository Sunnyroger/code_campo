# encoding: utf-8
class Reply
	include Mongoid::Document
	include Mongoid::Timestamps

	field :content

	belongs_to :user
	belongs_to :topic

	after_create :update_topic

	def update_topic
		topic.update_attribute :active_time, self.created_at
	end

end