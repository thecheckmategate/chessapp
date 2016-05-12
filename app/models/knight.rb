class Knight < Piece

	def valid_move?(x_target, y_target)
 		((x_position - x_target).abs + (y_position - y_target).abs == 3) && ((x_position != x_target && y_position != y_target))
 		# allows for moving three squares with the restriction that the 
 		# y_target and x_target are different from x_position and y_position
	end 


end
