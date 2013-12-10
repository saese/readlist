class Link < ActiveRecord::Base
	belongs_to :subtopic
	validates :title, :presence => true, :length => { minimum: 6 }
	validates :description, :presence => true, :length => { minimum: 6 }
	validates :hlink, :presence => true, :length => { minimum: 6 }
end
