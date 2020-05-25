class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  def index
    @teams = Team.all.order('name asc')
  end

  def show; end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    #@team.user_ids = current_user.id
    if @team.save
      @team.team_user.create(user_id: current_user.id, role: 'organizer')
      redirect_to root_path, notice: "Team #{@team.name} has been created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: "Team #{@team.title} has been edited"
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to root_path
  end

  def join
    @team = Team.find(params[:team_id])
    @team.users << current_user
    redirect_to root_path
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, user_ids: [])
  end
end
