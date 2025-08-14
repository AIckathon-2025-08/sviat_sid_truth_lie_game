# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_12_20_000003) do
  create_table "games", force: :cascade do |t|
    t.string "candidate_name", null: false
    t.string "candidate_photo", null: false
    t.boolean "is_active", default: true
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_active"], name: "index_games_on_is_active"
    t.index ["started_at"], name: "index_games_on_started_at"
  end

  create_table "statements", force: :cascade do |t|
    t.integer "game_id", null: false
    t.text "content", null: false
    t.boolean "is_truth", null: false
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "order"], name: "index_statements_on_game_id_and_order"
    t.index ["game_id"], name: "index_statements_on_game_id"
    t.index ["is_truth"], name: "index_statements_on_is_truth"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "statement_id", null: false
    t.string "employee_name", null: false
    t.datetime "voted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "employee_name"], name: "index_votes_on_game_id_and_employee_name", unique: true
    t.index ["game_id"], name: "index_votes_on_game_id"
    t.index ["statement_id"], name: "index_votes_on_statement_id"
    t.index ["voted_at"], name: "index_votes_on_voted_at"
  end

  add_foreign_key "statements", "games"
  add_foreign_key "votes", "games"
  add_foreign_key "votes", "statements"
end
