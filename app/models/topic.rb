class Topic < ActiveRecord::Base
	has_many :subtopics
	belongs_to :user
	validates :title, :presence => true, :length => { minimum: 6 }
	validates :description, :presence => true, :length => { minimum: 6 }
end
