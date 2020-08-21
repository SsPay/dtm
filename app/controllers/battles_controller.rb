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
    @battle = Battle.new(battle_params[:closed])
    @battle.user_id = current_user.id
    @battle.teams << Team.find(battle_params[:team_id])
    if @battle.save
      redirect_to battles_path, notice: "Battle has been created"
    else
      render :new
    end
  end

  def join
    @battle = Battle.find(battle_params[:battle_id])
    @battle.teams << Team.find(battle_params[:team_id])
    redirect_back(fallback_location: root_path)
  end

  def set_winner
    @battle = Battle.find(battle_params[:battle_id])
    @battle.update_attribute(:winner_id, battle_params[:winner_id])
    RatingWorker.perform_async(battle_params[:winner_id], @battle.id)
    redirect_back(fallback_location: root_path)
  end

  private


  def battle_params
    params.require(:battle).permit(:closed, :winner_id, :battle_id, :team_id, team_ids: [])
  end
end
