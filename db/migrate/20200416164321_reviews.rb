class Reviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.boolean :rating
      t.references :game, foreign_key: true
      t.references :player, foreign_key: true
    end
  end
end
