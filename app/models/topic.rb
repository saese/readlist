class Topic < ActiveRecord::Base
	has_many :subtopics
	validates :title, :presence => true, :length => { minimum: 6 }
	validates :description, :presence => true, :length => { minimum: 6 }
end
