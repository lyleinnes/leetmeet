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



ActiveRecord::Schema.define(version: 20171026062908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendees_on_event_id"
    t.index ["user_id"], name: "index_attendees_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_interests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_interests_on_category_id"
    t.index ["user_id"], name: "index_category_interests_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "location"
    t.bigint "game_id"
    t.bigint "category_id"
    t.text "about"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lat"
    t.float "long"
    t.datetime "start_at"
    t.datetime "end_at"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["game_id"], name: "index_events_on_game_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "game_interests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_interests_on_game_id"
    t.index ["user_id"], name: "index_game_interests_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.text "bio"
    t.integer "reputation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "voter_id"
    t.integer "recipient_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendees", "events"
  add_foreign_key "attendees", "users"
  add_foreign_key "category_interests", "categories"
  add_foreign_key "category_interests", "users"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "games"
  add_foreign_key "events", "users"
  add_foreign_key "game_interests", "games"
  add_foreign_key "game_interests", "users"
end
