class RemoveColumnsFromPlayersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :players, :num_players
    remove_column :players, :youngest_age
    remove_column :players, :competative
    remove_column :players, :family_friendly
    remove_column :players, :session_time
  end
end
