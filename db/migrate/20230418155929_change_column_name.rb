
class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :feedbacks, :feedback, :label
  end
end
