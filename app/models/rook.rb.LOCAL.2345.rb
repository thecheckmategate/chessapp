class Rook < Piece

	def valid_move?(x_target, y_target)
 		(x_position == x_target) || (y_position == y_target)
 		# allows for move to any number of squares vertically or horizontally 
	end 

end
