class PiecesController < ApplicationController
	def create
		@pieces = current_game.pieces.create(piece_params)
	end

	def show
		seleced_piece = Piece.find(params[:id])
		@pieces = @seleced_piece.game.pieces
	end

	def update
		@piece = Piece.find(params[:id])
		row = params[:x_position]
		col = params[:y_position]
		@piece.update_attributes(:x_position => row, :y_position => col)
		redirect_to game_path
	end

	private

	def piece_params
		params.require(:piece).permit(:game_id, :user_id, :type, :image, :x_position, :y_position)
	end

	def current_game
		@current_game ||= Game.find(params[:id])
	end
end
