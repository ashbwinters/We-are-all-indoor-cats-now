# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_16_164321) do

  create_table "games", force: :cascade do |t|
    t.text "name"
    t.integer "players_min"
    t.integer "players_max"
    t.integer "setup_time"
    t.integer "play_time"
    t.text "genre"
    t.integer "age_min"
    t.boolean "competative"
    t.integer "learning_curve"
    t.boolean "family_friendly"
    t.boolean "expansions"
    t.text "description"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
  end

  create_table "reviews", force: :cascade do |t|
    t.boolean "rating"
    t.integer "game_id"
    t.integer "player_id"
    t.index ["game_id"], name: "index_reviews_on_game_id"
    t.index ["player_id"], name: "index_reviews_on_player_id"
  end

  add_foreign_key "reviews", "games"
  add_foreign_key "reviews", "players"
end
