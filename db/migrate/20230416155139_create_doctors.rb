class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
       t.string :staff_id
       t.string :role
       t.integer :user_id
       t.timestamps
    end
  end
end
