class GamesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :find_game!, only: [:show, :edit, :update, :join]

	def index
		@games = Game.all
	end

	def new
		@game = Game.new
	end

	def create
		@game = current_user.games.create(game_params)
		redirect_to games_path  
	end

	def join
		if @game.white_id.present?
			@game.update_attributes(black_id: current_user.id) unless @game.full? 
		else 
			@game.update_attribute(white_id: current_user.id) unless @game.full? 
		end 
		@game.set_board 
		redirect_to games_path 
	end 

	def show
		@game = Game.find(params[:id])
	end

	def edit
	end 

	def update 
	end

private
	
	def find_game! 
		@game ||= Game.find(params[:id])
	end 

	def game_params
		params.require(:game).permit(:white_id, :black_id, :user_id, :name, :description)
	end

end
