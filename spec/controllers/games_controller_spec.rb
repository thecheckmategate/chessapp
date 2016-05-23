require 'rails_helper'

RSpec.describe GamesController, type: :controller do
	describe "games#index action" do 
		it "should successfully show the games/index page" do 
		get :index 
		expect(response).to have_http_status(:success)
		end 
	end 

	describe "games#create" do
		it "should check if user is logged in" do
			post :create
			expect(response).to redirect_to new_user_session_path
		end

		it "should allow user to create a game" do
			user = FactoryGirl.create(:user)
			sign_in user
			post :create, game: {name: "New Chess Game"}
			expect(response).to redirect_to games_path
			g = Game.last
			expect(g.name).to eq("New Chess Game")
		end
	end
end
