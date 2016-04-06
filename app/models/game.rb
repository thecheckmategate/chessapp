class Game < ActiveRecord::Base
	after_create :set_board! 
	# in rails an exclamantion point means that the method will throw exception on failure rather than silent failure 

	has_many :pieces
	belongs_to :user 

	def set_board!
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
	# bottom side 
	    [*0..7].each do |position|
	      Pawn.create(
	        game_id: id,
	        x_position: position,
	        y_position: 1
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

	    # top side 

	    [*0..7].each do |position|
	      Pawn.create(
	        game_id: id,
	        x_position: position,
	        y_position: 6
	        )
	    end

	    Rook.create(game_id: id, x_position: 0, y_position: 7)
	    Rook.create(game_id: id, x_position: 7, y_position: 7)

	    Knight.create(game_id: id, x_position: 1, y_position: 7)
	    Knight.create(game_id: id, x_position: 6, y_position: 7)

	    Bishop.create(game_id: id, x_position: 2, y_position: 7)
	    Bishop.create(game_id: id, x_position: 5, y_position: 7)

	    Queen.create(game_id: id, x_position: 3, y_position: 7)
	    King.create(game_id: id, x_position: 4, y_position: 7)
  	end


  	def full? 
  		white_id != nil && black_id != nil 
  	end 


 end 



