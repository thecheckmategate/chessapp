require 'rails_helper'

RSpec.describe King, type: :model do
  
  it "does a valid move" do 
  	King.create(x_position: 2, y_position: 2)
  	king = King.last
  	expect(king.executable_move?(2,3)).to be_truthy
  end

  it "does a valid move" do 
  	Rook.create(x_position: 2, y_position: 2)
  	rook = Rook.last
  	expect(rook.executable_move?(4,4)).to be_falsey
  end

end
