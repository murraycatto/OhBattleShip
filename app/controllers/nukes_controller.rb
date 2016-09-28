require 'rest-client'
class NukesController < ApplicationController
  # Post /nuke
  def nuke
    @user = User.find(params[:user_id])
    x = params[:x]
    y = params[:y]
    begin
      nuke_response = RestClient.post "http://battle.platform45.com/nuke", {'id' => @user.game_id, "x"=>x, "y"=>y}.to_json, {content_type: :json, accept: :json}
    rescue RestClient::ExceptionWithResponse => e
      nuke_response = e.response
    end
    puts "Platoform 45 Response"
    puts nuke_response
    puts "################"

    respond_to do |format|
      if nuke_response.code == 200
        json_reponse = JSON.parse(nuke_response)
        if json_reponse.key?("sunk")
          ship = Ship.find_by(name:json_reponse["sunk"])
          ShipsSunk.create(user_id:@user.id,ship_id:ship.id)
        end
        if json_reponse.key?("game_status")
          if json_reponse["game_status"] ==  "lost"
            @user.game_status = 0
          else
            @user.game_status = 1
          end
          @user.save
        end
        @nuke = Nuke.new(:user_id=>@user.id,:x=>x,:y=>y,:status=>json_reponse["status"])
        if @nuke.save
          format.json { render :nuke}
        else
          format.json { render json: @nuke.errors, status: :unprocessable_entity }
        end
      end
    end
  end

end
