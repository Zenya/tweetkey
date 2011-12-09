class AddRankColumn < ActiveRecord::Migration
  def up
    add_column :tweets, :rank, :integer
  end

  def down
  end
end


