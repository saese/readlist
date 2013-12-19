class AddPositionToSubtopics < ActiveRecord::Migration
  def change
    add_column :subtopics, :position, :integer
  end
end
