require 'spec_helper'

describe "Nukes" do

  describe "POST /Nuke.json" do
    it "creates a game then fires a nuke" do
      visit new_user_path
      fill_in('Name', :with => 'Murray')
      fill_in('Email', :with => 'Murraycatto@live.co.za')
      click_on('Save')
      page.should have_css('#0-0')
      # Create a user in a diffrent way
      user = User.order(:id).last
      post_via_redirect '/nuke.json', :x => "0", :y=>"0",:user_id => user.id
      json_reponse = JSON.parse(response.body)
      json_reponse["status"].should be_in(["hit", "miss"])
    end
  end
  
end
