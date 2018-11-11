class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :given_name
      t.string :family_name
      t.string :name
      t.string :picture
      t.string :gender
      t.string :locale
      t.string :role

      t.string :company_name

      t.timestamps
    end
  end
end
