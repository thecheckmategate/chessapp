class PiecesController < ApplicationController
	def create
		@pieces = current_game.pieces.create(piece_params)
	end

	def show
		@piece = Piece.find(params[:id])
	end

	def update
		@piece = Piece.find(params[:id])
		row = params[:x_position]
		col = params[:y_position]

		if @piece && row.present? && col.present?
			@piece.update_attributes(:x_position => row, :y_position => col)
		end

		respond_to do |format|
			format.html { render :show }
			format.json { render json: @piece, status: :ok }
		end
	end

	private

	def piece_params
		params.require(:piece).permit(:game_id, :user_id, :type, :image, :x_position, :y_position)
	end

	def current_game
		@current_game ||= Game.find(params[:id])
	end
end
