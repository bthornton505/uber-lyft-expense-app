class ChangeCommentToDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :comment, :description
  end
end
