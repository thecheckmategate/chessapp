class RemovePieceIdFromPieces < ActiveRecord::Migration
  def change
  	remove_column :pieces, :piece_id, :string
  end
end
