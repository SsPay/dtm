class AddWinnerIdToBattles < ActiveRecord::Migration[6.0]
  def change
    add_column :battles, :winner_id, :int
  end
end
