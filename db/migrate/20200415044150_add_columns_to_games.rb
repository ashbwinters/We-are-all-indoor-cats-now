class AddColumnsToGames < ActiveRecord::Migration[6.0]
  def change
      add_column :games, :expansions, :boolean
      add_column :games, :description, :text
  end
end
