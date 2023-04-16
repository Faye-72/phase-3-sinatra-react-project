class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
       t.integer :patient_id
       t.string :feedback
       t.string :value
       t.timestamps
    end
  end
end
