class Pawn < Piece
	def to_ascii_piece
		color == 'white' ? '&#9817;' : '&#9823;'
	end

	def valid_move?(x_target, y_target) 
		if color == 'black' 
			(y_position - y_target == 1) && (x_position == x_target) 
			y_position - y_target == 2 if y_position == 1	
		else 
			(y_position - y_target == -1) && (x_position == x_target) 
			(y_position - y_target == -2) if y_position == 6			
		end  

	end 

end
