class Game < ActiveRecord::Base
	# in rails an exclamantion point means that the method will throw exception on failure rather than silent failure

	has_many :pieces
	belongs_to :user
	belongs_to :white_player, :class_name => 'User', :foreign_key => 'white_id'
	belongs_to :black_player, :class_name => 'User', :foreign_key => 'black_id'

	validates :name, :presence => true

	def set_board
=begin
	creating the each pieces here
	note that we are still missing the fields for user_id and image
	the image isn't a big deal right now and more of an HTML/JavaScript thing that can be hashed out
	however the user_is critical to linking which piece is whose
	that can be updated later in the games controller with the update method


	chessboard setup array of arrays
	[[rook, knight, bishop, king, queen, bishop, knight, rook]
	[pawn, pawn,   pawn,   pawn, pawn,  pawn,   pawn,   pawn]
	[empt, empt,   empt,   empt, empt,  empt    empt,   empt]
	[empt, empt,   empt,   empt, empt,  empt    empt,   empt]
	[empt, empt,   empt,   empt, empt,  empt    empt,   empt]
	[empt, empt,   empt,   empt, empt,  empt    empt,   empt]
	[pawn, pawn,   pawn,   pawn, pawn,  pawn,   pawn,   pawn]
	[rook, knight, bishop, king, queen, bishop, knight, rook]]
=end
	# bottom side black player
	    [*0..7].each do |position|
	      Pawn.create(
	        game_id: id,
	        x_position: position,
	        y_position: 1,
	        user_id: black_id
	        )
	    end

		King.create(game_id: id, x_position: 4, y_position: 0, user_id: black_id)
		Queen.create(game_id: id, x_position: 3, y_position: 0, user_id: black_id)

	    Rook.create(game_id: id, x_position: 0, y_position: 0, user_id: black_id)
	    Rook.create(game_id: id, x_position: 7, y_position: 0, user_id: black_id)

	    Knight.create(game_id: id, x_position: 1, y_position: 0, user_id: black_id)
	    Knight.create(game_id: id, x_position: 6, y_position: 0, user_id: black_id)

	    Bishop.create(game_id: id, x_position: 2, y_position: 0, user_id: black_id)
	    Bishop.create(game_id: id, x_position: 5, y_position: 0, user_id: black_id)

	# top side bottom side white player
	    [*0..7].each do |position|
	      Pawn.create(
	        game_id: id,
	        x_position: position,
	        y_position: 6,
	        user_id: white_id
	        )
	    end

	    Rook.create(game_id: id, x_position: 0, y_position: 7, user_id: white_id)
	    Rook.create(game_id: id, x_position: 7, y_position: 7, user_id: white_id)

	    Knight.create(game_id: id, x_position: 1, y_position: 7, user_id: white_id)
	    Knight.create(game_id: id, x_position: 6, y_position: 7, user_id: white_id)

	    Bishop.create(game_id: id, x_position: 2, y_position: 7, user_id: white_id)
	    Bishop.create(game_id: id, x_position: 5, y_position: 7, user_id: white_id)

	    Queen.create(game_id: id, x_position: 3, y_position: 7, user_id: white_id)
	    King.create(game_id: id, x_position: 4, y_position: 7, user_id: white_id)
  	end

  	def full?
  		white_id != nil && black_id != nil
  	end

		def self.find_by_position(x, y, game_id)
 			Piece.where(x_position: x, y_position: y, game_id: game_id).first
 		end

		def piece_at(x, y)
			Piece.where(game_id: self.id, row_position: x, col_position: y).at?
		end
end
