# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 3) do

  create_table "games", force: :cascade do |t|
    t.text "game_intro"
    t.integer "opener_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.integer "user_health"
    t.integer "user_score"
    t.string "country_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
