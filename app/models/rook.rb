class Rook < Piece
  def to_ascii_piece
    # check the color the piece
    "&#9820;".html_safe
  end

	def valid_move?(x_target, y_target)
 		((x_position == x_target) || (y_position == y_target))
 		# allows for move to any number of squares vertically or horizontally 
	end 

end
