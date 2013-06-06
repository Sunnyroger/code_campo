# encoding: utf-8
class Topic
	include Mongoid::Document
	include Mongoid::Timestamps

	attr_accessible :title, :content

	paginates_per 15

	field :title
	field :content
	field :tags,        type: Array
	field :active_time, type: DateTime
	field :number_id,   type: Integer
	#index :number_id,   :unique => true

	belongs_to :user
	has_many :replies

	before_create :set_active_time, :set_number_id

	validates :title, :presence => { :message => "请输入标题"},
										:length => { 
											:in => 2..200,
											:too_long => "这个标题有点长。",
											:too_short => "太短了，说点什么吧。"
											 }
	validates :content, :presence => { :message => "请输入内容"},
											:length => { 
												:minimum => 2,
												:too_short => "太短了，说点什么吧。"
											 }
	validates :user_id, :presence => true

	def set_active_time
		self.active_time = Time.now
	end

	def set_number_id
		
	end

end
