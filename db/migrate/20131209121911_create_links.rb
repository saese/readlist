class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.text :description
      t.integer :serial_number
      t.string :hlink
      t.references :subtopic

      t.timestamps
    end
    add_index :links, :subtopic_id
  end
end
