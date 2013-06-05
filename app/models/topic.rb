# encoding: utf-8
class Topic
	include Mongoid::Document
	include Mongoid::Timestamps

	paginates_per 10

	field :title
	field :content
	field :tags, type: Array
	field :active_time, type: DateTime

	belongs_to :user

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

end
