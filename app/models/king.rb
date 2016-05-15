class King < Piece
	def to_ascii_piece
		color ? 'white_id' : 'black_id'
		"&#9818;".html_safe
	end

	def valid_move?(x_target, y_target)
 			(x_position - x_target).abs <= 1 && (y_position - y_target).abs <= 1
	end

end
