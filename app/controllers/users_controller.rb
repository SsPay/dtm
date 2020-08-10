class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
    @teams = @user.teams
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User #{@user.nickname} has been edited"
    else
      render :edit
    end
  end

  def index

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:favourite_team_id)
  end

end
