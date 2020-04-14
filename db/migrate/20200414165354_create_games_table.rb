class CreateGamesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.text :name
      t.integer :players_min
      t.integer :players_max
      t.integer :setup_time
      t.integer :play_time
      t.text :genre
      t.integer :age_min
      t.boolean :competative
      t.integer :learning_curve
      t.boolean :family_friendly
    end
  end
end
