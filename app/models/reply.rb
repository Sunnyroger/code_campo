# encoding: utf-8
class Reply
	include Mongoid::Document
	include Mongoid::Timestamps

	attr_accessible :content

	field :content

	belongs_to :user
	belongs_to :topic

	paginates_per 15

	validates :content, presence: { message: '回复不能为空' }

	after_create :update_topic

	def update_topic   #fix me. 关于reply的ajax的 回复
		self.topic.update_attribute :active_time, self.created_at
		self.topic.inc :replies_count, 1
	end

end