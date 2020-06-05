class CreateTeamBattles < ActiveRecord::Migration[6.0]
  def change
    create_table :team_battles do |t|
      t.belongs_to :battle
      t.belongs_to :team
      t.timestamps
    end
  end
end
