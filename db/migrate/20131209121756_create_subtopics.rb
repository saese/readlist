class CreateSubtopics < ActiveRecord::Migration
  def change
    create_table :subtopics do |t|
      t.string :title
      t.text :description
      t.integer :lesson_number
      t.references :topic

      t.timestamps
    end

    add_index :subtopics, :topic_id
  end
end
