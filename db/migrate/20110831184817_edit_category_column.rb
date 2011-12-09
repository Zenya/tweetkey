class EditCategoryColumn < ActiveRecord::Migration
  def up
    remove_column :tweets, :category
    add_column :tweets, :category, :integer
  end

  def down
  end
end
