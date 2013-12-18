class AddDescriptionToTopics < ActiveRecord::Migration
  def change
  	remove_column :topics, :description
    add_column :topics, :description, :text

  end
end
