class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @teams = @user.teams
  end

  def index

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
