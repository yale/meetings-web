class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :name
      t.datetime :date
      t.text :agenda
      t.integer :created_by_id

      t.timestamps
    end
  end
end
