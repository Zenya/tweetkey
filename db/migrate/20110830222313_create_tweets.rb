class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :category
      t.string :hotkey
      t.text :description

      t.timestamps
    end
  end
end
