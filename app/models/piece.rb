class Piece < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :game

def move_to!(new_x, new_y)

	# This move_to method should handle the following cases:
# Check to see if there is a piece in the location it’s moving to.
# If there is a piece there, and it’s the opposing color, remove the piece from the board. This can be done a few different ways.
# You could have a “status” flag on the piece that will be one of “onboard” or “captured”.
# You could set the piece’s x/y coordinates to nil
# You could delete the item from the database.
# Each solution has pros/cons.
# If the piece is there and it’s the same color the move should fail - it should either raise an error message or do nothing.
# It should call update_attributes on the piece and change the piece’s x/y position.

# -----------------------------------------------------------------------------------------
# Update attributes will not check for validation...... What about using .update ???
# ---------------------------------------------------------------------------------- Eric--




end


end
