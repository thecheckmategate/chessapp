class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :games
  has_many :enrollments 
  # has_many :enrollments 
  has_many :enrolled_games, through: :enrollments, source: :game

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   

  def enrolled_in?(game)
  	return enrolled_games.include?(game)
  end 

end


# Started GET "/games/5" for 10.0.2.2 at 2016-03-28 03:24:33 +0000
# Processing by GamesController#show as HTML
#   Parameters: {"id"=>"5"}
#   Game Load (0.6ms)  SELECT "games".* FROM "games" WHERE "games"."id" = $1 LIMIT 1  [["id", "5"]]
#   User Load (0.9ms)  SELECT "users".* FROM "users" WHERE "users"."id" = 2 ORDER BY "users"."id" ASC LIMIT 1
#   Game Exists (2.4ms)  SELECT 1 AS one FROM "games" INNER JOIN "enrollments" ON "games"."id" = "enrollments"."game_id" WHERE "enrollments"."user_id" = $1 AND "games"."id" = 5 LIMIT 1  [["user_id", 2]]
#   Rendered games/show.html.erb within layouts/application (9.2ms)
# Completed 200 OK in 420ms (Views: 412.5ms | ActiveRecord: 4.0ms)
