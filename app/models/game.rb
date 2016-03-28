class Game < ActiveRecord::Base
	belongs_to :user 
	has_many :enrollments 
	has_many :pieces 


end
