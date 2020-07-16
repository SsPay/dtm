class AddClosedToBattles < ActiveRecord::Migration[6.0]
  def change
    add_column :battles, :closed, :boolean, default: false
  end
end
