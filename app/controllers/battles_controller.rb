class BattlesController < ApplicationController

  def index
    @battles = Battle.all
  end

  def new
    @battle = Battle.new
    @teams = current_user.teams
  end

  def create
    @battle = Battle.new
    @battle.user_id = current_user.id
    @battle.team_ids = params[:battle][:team_id]
    if @battle.save
      redirect_to root_path, notice: "Battle has been created"
    else
      render :new
    end
  end

  private

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.require(:battle).permit(:team_id)
  end
end
