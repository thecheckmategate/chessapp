class GamesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :find_game!, only: [:show, :edit, :update]

	def index
		@game = Game.all
	end

	def new
		@game = Game.new
	end

	def create
		@game = current_user.games.create(game_params)
		redirect_to root_path  
	end

	def join 
	end 

	def show
		
	end

	def edit
		
	end 

	def update 
		# update color 
	end

private
	
	def find_game 
		@game ||= Game.find(params[:id])
	end 

	def game_params
		params.require(:game).permit(:white_id, :black_id, :user_id, :name, :description)
	end

end
