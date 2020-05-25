class AddRoleToTeamUser < ActiveRecord::Migration[6.0]
  def change
    add_column :team_users, :role, :string
  end
end
