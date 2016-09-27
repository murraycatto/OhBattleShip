require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "shows the users" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get users_path
      response.status.should be(200)
    end
  end
  describe "POST /users" do
    it "creates a task" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      post_via_redirect users_path, :user => {:name => "Murray", :email=>"murraycatto@live.co.za"}
      response.body.should include("Murray")
      response.body.should_not include("Server error")
    end
  end
end
