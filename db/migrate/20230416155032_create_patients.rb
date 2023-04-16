class CreatePatients < ActiveRecord::Migration[6.1]
  def change
   create_table :patients do |t|
       t.string :patient_id
       t.string :status
       t.string :location
       t.integer :user_id
       t.timestamps
    end
  end
end
