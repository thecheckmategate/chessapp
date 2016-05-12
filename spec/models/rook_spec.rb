require 'rails_helper'

RSpec.describe Rook, type: :model do
  
  it "does a valid move" do 
  	Rook.create(x_position: 2, y_position: 2)
  	rook = Rook.last
  	expect(rook.executable_move?(2,4)).to be_truthy
  end

end
