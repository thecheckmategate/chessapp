class Game < ActiveRecord::Base
	after_create :set_board! 
	# in rails an exclamantion point means that the method will throw exception on failure rather than silent failure 

	has_many :pieces
	belongs_to :user 


	def set_board 
=begin
	creating the each pieces here
	note that we are still missing the fields for user_id and image 
	image isn't really a big issue right now, but I think user_id is 

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

    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 1,
        color: true
        )
    end

	King.create(game_id: id, x_position: 4, y_position: 0)
	Queen.create(game_id: id, x_position: 3, y_position: 0)
    
    Rook.create(game_id: id, x_position: 0, y_position: 0)
    Rook.create(game_id: id, x_position: 7, y_position: 0)

    Knight.create(game_id: id, x_position: 1, y_position: 0)
    Knight.create(game_id: id, x_position: 6, y_position: 0)

    Bishop.create(game_id: id, x_position: 2, y_position: 0)
    Bishop.create(game_id: id, x_position: 5, y_position: 0)

    Queen.create(game_id: id, x_position: 3, y_position: 0)
    King.create(game_id: id, x_position: 4, y_position: 0)

    # Black Pieces
    (0..7).each do |i|
      Pawn.create(
        game_id: id,
        x_position: i,
        y_position: 6,
        color: false
        )
    end

    Rook.create(game_id: id, x_position: 0, y_position: 7, color: false)
    Rook.create(game_id: id, x_position: 7, y_position: 7, color: false)

    Knight.create(game_id: id, x_position: 1, y_position: 7, color: false)
    Knight.create(game_id: id, x_position: 6, y_position: 7, color: false)

    Bishop.create(game_id: id, x_position: 2, y_position: 7, color: false)
    Bishop.create(game_id: id, x_position: 5, y_position: 7, color: false)

    Queen.create(game_id: id, x_position: 3, y_position: 7, color: false)
    King.create(game_id: id, x_position: 4, y_position: 7, color: false)
  end



