class CreatePlayersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer :num_players
      t.integer :youngest_age
      t.boolean :competative
      t.boolean :family_friendly
      t.integer :session_time
    end
  end
end
