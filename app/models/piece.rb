class Piece < ActiveRecord::Base
	after_create :assignment!
	
	belongs_to :user
	belongs_to :game


	def assignment 
	end 

end
