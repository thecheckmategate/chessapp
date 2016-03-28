class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title 
      t.text :description 
      t.integer :white_id 
      t.integer :black_id 
      t.integer :user_id 

      t.timestamps
    end
      add_index :games, [:user_id]
  end
end
