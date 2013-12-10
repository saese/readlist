class Subtopic < ActiveRecord::Base
	has_many :links
	belongs_to :topic
	validates :title, :presence => true, :length => { minimum: 6 }
	validates :description, :presence => true, :length => { minimum: 6 }
end
