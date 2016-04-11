class Piece < ActiveRecord::Base

	belongs_to :user
	belongs_to :game

	def executable_move?(x_target, y_target)
		return false unless valid_move?(x_target, y_target) # => if the move isn't valid for its type 
		return false unless on_board?(x_target, y_target) # => if the piece tries to move outside the board 
		return false if obstacle_between?(x_target, y_target) # => if there is obstruction in between 
		return false if no_move?(x_target, y_target) # => if the piece doesn't move at all 
	end 

	def no_move?(x_target, y_target) 
		(x_position == x_target) && (y_position == y_target)
	end 


	def self.find_by_position(x, y, game_id)
		Piece.where(x_position: x, y_position: y, game_id: game_id).first
	end


end
