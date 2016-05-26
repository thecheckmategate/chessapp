class King < Piece
	def to_ascii_piece
		color == 'white' ? '&#9812;' : '&#9818;'
	end

	def valid_move?(x_target, y_target)
		(x_position - x_target).abs <= 1 && (y_position - y_target).abs <= 1
	end

end
