class RemoveCategoryIdFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :category_id
  end
end
