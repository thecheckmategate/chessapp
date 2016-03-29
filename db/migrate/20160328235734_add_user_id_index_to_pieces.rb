class AddUserIdIndexToPieces < ActiveRecord::Migration
  def change
    add_index :pieces, :user_id
    add_index :pieces, :game_id
  end
end
