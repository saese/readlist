class AddUserIdToSubtopics < ActiveRecord::Migration
  def change
    add_column :subtopics, :user_id, :string
  end
end
