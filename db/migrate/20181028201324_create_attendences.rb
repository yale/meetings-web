class CreateAttendences < ActiveRecord::Migration[5.2]
  def change
    create_table :attendences do |t|
      t.references :user
      t.references :meeting

      t.timestamps
    end
  end
end
