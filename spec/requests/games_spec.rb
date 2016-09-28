require 'spec_helper'

describe "Games" do

  describe "GET /games" do
    it "Shows the games" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get games_path
      response.status.should be(200)
    end
  end

  describe "POST /game/new" do
    it "Creates a user/game" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      post_via_redirect create_game_path, :user => {:name => "Murray", :email=>"murraycatto@live.co.za"}
      response.body.should include("Murray")
      response.body.should_not include("Server error")
    end
  end


end
