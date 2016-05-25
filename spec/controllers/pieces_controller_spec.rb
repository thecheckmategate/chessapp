require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
	describe "pieces#update" do
		it "should check if move is valid" do
		put :update, {id: piece_id, game_id: game.id, x_position: 4, y_position: 7}
		piece.reload
		expect(piece.x_position).to eql 4
		expect(piece.y_position).to eql 7
		end
	end
end