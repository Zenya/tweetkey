class EditColumn < ActiveRecord::Migration
  def up
    rename_column :tweets, :category, :category_id
  end

  def down
  end
end
