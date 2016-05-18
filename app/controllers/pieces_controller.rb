class PiecesController < ApplicationController
	
	def show
		seleced_piece = Piece.find(params[:game_id])
		@pieces = @seleced_piece.game.pieces
	end

	def update
		@piece = Piece.find(params[:game_id])
		row = params[:x_position]
		col = params[:y_position]
		@piece.update_attributes(:x_position => row, :y_position => col)
		redirect_to game_path
	end

	private

	def piece_params
		params.require(:piece).permit(:game_id, :user_id, :type, :image, :x_position, :y_position)
	end
end
