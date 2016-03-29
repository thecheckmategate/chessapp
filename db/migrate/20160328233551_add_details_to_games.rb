class AddDetailsToGames < ActiveRecord::Migration
  def change
    add_column :games, :description, :text
    add_column :games, :white_id, :integer
    add_column :games, :black_id, :integer
  end
end
