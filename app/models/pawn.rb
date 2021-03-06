class Pawn < Piece
	def to_ascii_piece
		color == 'white' ? '&#9817;' : '&#9823;'
	end

	def valid_move?(x_target, y_target)
 		(y_position - y_target).abs == 1
 		# allows for vertical move up to one square vertically
 		# don't have rationale for moving two squares vertically when starting from origin
	end

end
