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
    id = params[:winner_id][:winner_id]
    puts "iiid: #{params[:winner_id][:winner_id]}"
    @battle = Battle.find(params[:battle_id])
    @battle.update_attribute(:winner_id, params[:winner_id][:winner_id])
    @winner = @battle.teams.where(id: params[:winner_id][:winner_id]).first
    @looser = @battle.teams.where.not(id: params[:winner_id][:winner_id]).first
    @winner.update(rating: @winner.rating += 20)
    @looser.update(rating: @looser.rating -= 20)
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
