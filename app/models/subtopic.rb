class Subtopic < ActiveRecord::Base
	has_many :links
	belongs_to :topic
	acts_as_list
	validates :title, :presence => true, :length => { minimum: 6 }
	validates :description, :presence => true, :length => { minimum: 6 }
end
