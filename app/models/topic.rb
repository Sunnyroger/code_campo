class Topic
	include Mongoid::Document
	include Mongoid::Timestamps

	field :title
	field :content
	field :tags, type: Array
	field :active_time, type: DateTime

	belongs_to :user

	validates :title, :presence => true, 
										:length => {:in => 6..200 }
	validates :content, :presence => true,
											:length => { :minimum => 2 }
	validates :user_id, :presence => true

end
