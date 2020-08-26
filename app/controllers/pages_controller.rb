class PagesController < ApplicationController
  # before_action :search

  def show
    render template: "pages/#{params[:page]}"
  end

  def search
    q = params[:q]
    @teams = Team.search(name_cont: q).result
    @users = User.search(nickname_cont: q).result
  end
end
