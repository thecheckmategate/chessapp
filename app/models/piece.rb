class Piece < ActiveRecord::Base

	belongs_to :user
	belongs_to :game

	def executable_move?(x_target, y_target)
		return false unless valid_move?(x_target, y_target) # => if the move isn't valid for its type
		return false unless on_board?(x_target, y_target) # => if the piece tries to move outside the board
		return false if obstacle_between?(x_target, y_target) # => if there is obstruction in between
		return false if no_move?(x_target, y_target) # => if the piece doesn't move at all
	end

	def no_move?(x_target, y_target)
		(x_position == x_target) && (y_position == y_target)
	end

	def obstacle_between(x_target, y_target)
		return false if diagonal_obstruction?(x_target, y_target).include?([x_target, y_target)
		return false if rectilinear_collection?(x_target, y_target).include?([x_target, y_target])
	end

	def on_board?(x_target, y_target)
		false unless (0 <= x_target <= 7) && (0 <= y_target <= 7)
	end

	def self.find_by_position(x, y, game_id)
		Piece.where(x_position: x, y_position: y, game_id: game_id).first
	end

	def diagonal_obstruction?(x_target, y_target)
		# collects all positions diagonal and in between current piece and destination piece
		current_x_postion = x_position
		# safe to create a copy of x_position since changing we are not changing x_position of the piece here
		current_y_postion = y_position
		# safe to create a copy of y_position since changing we are not changing y_position of the piece here

		# sample_array = [
		# [3,0,0,0,1]
		# [0,X,0,X,0]
		# [0,0,A,0,0]
		# [0,X,0,X,0]
		# [4,0,0,0,2]

		# consider a situation where we are going from A (2,2) to 1 (4,4)
		# we want to collect (3,3) => which is (2+1, 2+1)
		# here the condition is that x_position < x_target and y_position < y_target


		# consider a situation where we are going from A (2,2) to 2 (4,0)
		# we want to collect (3,1) which is (2+1, 2-1)
		# here the condition is that x_position < x_target and y_target > y_target

		# consider a situation where we are going from A (2,2) to 3 (0,4)
		# we want to collect (1,3) which is ()
		# here the condition is that x_position > x_target and y_position < y_target

		# consider a situation where we are going from A (2,2) to 4	(0,0)
		# we want to collect (1,1)
		# here the condition is that x_position > x_target and y_position > y_target

		# note that when x_position < x_target, the in-between positions are going to be +1 incrementations from x_position
		# note that when x_position > x_target, the in-between positions are going to be -1 incrementations from x_position

		# note that when y_position < y_target, the in-between positions are going to be +1 incrementations from y_position
		# note that when y_position > y_target, the in-between positions are going to be -1 incrementations from y_position

		# Hence:

		if x_target > current_x_postion
			x_increment = 1
		else
			x_increment = -1
		end

		if y_target > current_y_postion
			y_increment = 1
		else
			y_increment = -1
		end

		current_x_postion += x_increment
		current_y_postion += y_increment


		diagonal_collection  = Array.new()
		# instantiate an empty collector array

		until (current_x_postion -  x_target).abs == 0 && (current_y_postion - y_target) == 0
			diagonal_collection << [current_x_postion, current_y_postion]
			current_x_postion += x_increment
			current_y_postion += y_increment
		end

		return diagonal_collection

end


def rectilinear_obstruction?(x_target, y_target)
	# finds all rectilinear positions
	current_x_postion = x_position
	# safe to create a copy of x_position since changing we are not changing x_position of the piece here
	current_y_postion = y_position
	# safe to create a copy of y_position since changing we are not changing y_position of the piece here

	rectilinear_collection = Array.new()

	# sample_array = [
	# [0,0,1,0,0]
	# [0,0,0,0,0]
	# [4,0,A,0,2]
	# [0,0,0,0,0]
	# [0,0,3,0,0]

	# using the same logic as diagonal_obstruction? method

	if current_y_postion == y_target

        if x_target > current_x_postion
			x_increment = 1
		else
			x_increment = -1
		end

		current_x_postion += x_increment

      	until (current_x_postion - x_target).abs == 0
        	rectilinear_collection << [current_x_postion, current_y_postion]
        	current_x_postion += x_increment
      	end

  	elsif current_x_postion == x_target

        if y_target > current_y_postion
			y_increment = 1
		else
			y_increment = -1
		end

		current_y_postion += y_increment

      	until (current_y_position - y_target).abs == 0
        	rectilinear_collection << [current_x_postion, current_y_postion]
        	current_y_postion += y_increment
      	end
    end

    return rectilinear_collection

 end

end
