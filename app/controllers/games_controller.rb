require 'rest-client'
class GamesController < ApplicationController
  before_action :set_user, only: [:game]

  # GET /games
  # GET /games.json
  def index
    @users = User.order(:game_status)
  end

  # GET /game/1
  # GET /game/1.json
  def game
    @nukes = Nuke.where(user_id:params[:id])
    @ships = Ship.all
    @ships_sunk = ShipsSunk.where(user_id:params[:id])
  end

  # GET /game_status/1.json
  def game_status
    @user = User.find(params[:user_id])
    render :layout => false
  end

  # GET /ships_sunk/
  def ships_sunk
    @ships = Ship.all
    @ships_sunk = ShipsSunk.where(user_id:params[:user_id])
    @nukes = Nuke.where(user_id:params[:user_id])
    render :layout => false
  end

  # GET /game/new
  def new
    @user = User.new
  end

  # POST /games
  def create
    @user = User.new(user_params)
    begin
      battle_response = RestClient.post "http://battle.platform45.com/register", {'name' => @user.name,"email" =>@user.email}.to_json, {content_type: :json, accept: :json}
    rescue RestClient::ExceptionWithResponse => e
      battle_response = e.response
    end
    if battle_response.code == 200
      json_reponse = JSON.parse(battle_response)
      game_id = json_reponse["id"]
      @user.game_id = game_id
      if @user.save
        redirect_to game_path(@user), notice: 'Let the games begin'
      else
        render :new
      end
    else
      @user.errors.add(:base, :not_implemented, message: "Server error")
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
