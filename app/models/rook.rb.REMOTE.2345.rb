class Rook < Piece
  def to_ascii_piece
    # check the color the piece
    "&#9820;".html_safe
  end

end
