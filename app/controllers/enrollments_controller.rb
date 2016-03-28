class EnrollmentsController < ApplicationController
	before_action :authenticate_user! 
	# before_action :require_authorized_for_current_game, only: [:show]
	before_action :require_two_players

	def create 
		current_user.enrollments.create(game: current_game)
		# after creating the enrollment, direct to show game  
		redirect_to game_path(current_game)
	end

	private 

	# probably needs a lot of refactoring here
	def require_two_players 
		if current_game.white_id.present? && current_game.black_id.present? 
			render text: "Room is full", status: :unauthorized  
		elsif current_game.white_id.present? 
			current_game.update_attributes(black_id: current_user.id)
		elsif current_game.black_id.present?
			current_game.update_attributes(white_id: current_user.id)
		elsif (1 + rand(2) == 1) 
			current_game.update_attributes(white_id: current_user.id)						
		else
			current_game.update_attributes(black_id: current_user.id)
		end
	end 

	def current_game 
		@current_game ||= Game.find(params[:game_id])
	end  

end

	# def require_authorized_for_current_game 
	# 	if current_game.user != current_user 
	# 		render text: "Unauthorized", status: :unauthorized 
	# 	end 
	# end 
