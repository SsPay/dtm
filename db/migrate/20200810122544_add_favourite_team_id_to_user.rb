class AddFavouriteTeamIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :favourite_team_id, :int
  end
end
