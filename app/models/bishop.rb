class Bishop < Piece 

	def valid_move?(x_target, y_target) 
 		((x_position - x_target).abs == (y_position - y_target).abs)
 		# allows for move to any number of squares diagonally 
 	end 

end
