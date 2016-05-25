class PiecesController < ApplicationController
	
	def show
		selected_piece = Piece.find(params[:game_id])
		@pieces = @selected_piece.game.pieces
	end

	def update
		@piece = Piece.find(params[:game_id])
		row = params[:x_position]
		col = params[:y_position]
		@piece.update_attributes(:x_position => row, :y_position => col)
		redirect_to game_path
	end

	# $("piece").click(function (event) {
	# 	var movePiece = event.target;
	# 	$("piece").removeClass("selected_piece");
	# 	$("movePiece").addClass("selected_piece");
	# 	});

	private

	def piece_params
		params.require(:piece).permit(:game_id, :user_id, :type, :image, :x_position, :y_position)
	end
end
