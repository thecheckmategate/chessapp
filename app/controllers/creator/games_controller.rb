class Creator::GamesController < ApplicationController
	before_action :authenticate_user! 
	before_action :require_authorized_for_current_game, only: [:show]

	def new 
		@game = Game.new 
	end 

	def create
		@game = current_user.games.create(game_params)
		if @game.valid? 
			redirect_to game_path(@game)
		else 
			render :new, status: :unprocessable_entity
		end 
	end 

	def show 
		@game = Game.find(params[:id])
	end 

	private 

	def require_authorized_for_current_game 
		if current_game.user != current_user 
			render text: "Unauthorized", status: :unauthorized 
		end 
	end 

	helper_method :current_game 	
	def current_game 
		@current_game ||= Game.find(params[:id])
	end  

	def game_params 
		params.require(:game).permit(:title, :description, :white_id, :black_id)
	end 

end 


      # t.string :title 
      # t.text :description 
      # t.integer :white_id 
      # t.integer :black_id 
      # t.integer :user_id 

