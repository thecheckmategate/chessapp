require 'rails_helper'

RSpec.describe Pawn, type: :model do

  it "does a valid move" do 
  	Pawn.create(x_position: 2, y_position: 2)
  	pawn = Pawn.last
  	expect(pawn.executable_move?(2,3)).to be_truthy
  end

  it "does a valid move" do 
  	Pawn.create(x_position: 2, y_position: 2)
  	pawn = Pawn.last
  	expect(pawn.executable_move?(4,4)).to be_falsey
  end

end
