class AddRatingToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :rating, :int, default: 0
  end
end
