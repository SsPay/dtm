class BattlesController < ApplicationController

  def index
    @battles = Battle.where(closed: false)
    @teams = current_user.teams
  end

  def show
    @battle = Battle.find(params[:id])
  end

  def new
    @battle = Battle.new
    @teams = current_user.teams
  end

  def create
    @battle = Battle.new(battle_params)
    @battle.user_id = current_user.id
    @battle.teams << Team.find(params[:battle][:team_ids])
    if @battle.save
      redirect_to root_path, notice: "Battle has been created"
    else
      render :new
    end
  end

  def join
    @battle = Battle.find(params[:battle_id])
    @battle.teams << Team.find(params[:team_id][:team_id])
    redirect_back(fallback_location: root_path)
  end

  def set_winner
    @battle = Battle.find(params[:battle_id])
    @battle.update_attribute(:winner_id, params[:winner_id][:winner_id])
    redirect_back(fallback_location: root_path)
  end

  private

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.require(:battle).permit(:closed, :winner_id, team_ids: [])
  end
end
