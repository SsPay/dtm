class AddClosedToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :closed, :boolean
  end
end
