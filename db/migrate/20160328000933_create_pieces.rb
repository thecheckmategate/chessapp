class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :image 
      t.integer :y_position 
      t.integer :x_position 
      t.boolean :black, null: false, default: false 
      t.string :type 
      t.string :user_id 
      t.string :game_id 

      t.timestamps
    end
      add_index :pieces, [:user_id, :game_id]
      add_index :pieces, [:game_id]
  end
end
