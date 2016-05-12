require 'rails_helper'

RSpec.describe Knight, type: :model do

  it "does a valid move" do 
  	Knight.create(x_position: 2, y_position: 2)
  	knight = Knight.last
  	expect(knight.executable_move?(3,4)).to be_truthy
  end

  it "does a valid move" do 
  	Knight.create(x_position: 2, y_position: 2)
  	knight = Knight.last
  	expect(knight.executable_move?(2,4)).to be_falsey
  end

end
