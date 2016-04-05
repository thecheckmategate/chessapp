class GamesController < ApplicationController

	def index
		@game = Game.all
	end

	def new
		@game = Game.new
	end

	def create
		@game = Game.create
		redirect_to game_path(@game)
	end

	def show
		@game = Game.find(params[:id])
	end

private

	def game_params
		params.require(:game).permit(:white_id, :black_id, :user_id, :name, :description)
	end

end
