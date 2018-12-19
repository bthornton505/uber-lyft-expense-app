class ChangeNote < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :note, :comment
  end
end
