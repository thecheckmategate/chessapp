class AddDetailsToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :type, :string
    add_column :pieces, :x_position, :integer
    add_column :pieces, :y_position, :integer
   
  end 		
end
