require 'rails_helper'

RSpec.describe Bishop, type: :model do

  it "does a valid move" do 
  	Bishop.create(x_position: 2, y_position: 2)
  	bishop = Bishop.last
  	expect(bishop.executable_move?(4,4)).to be_truthy
  end

  it "does a valid move" do 
  	Bishop.create(x_position: 2, y_position: 2)
  	bishop = Bishop.last
  	expect(bishop.executable_move?(2,3)).to be_falsey
  end

end
