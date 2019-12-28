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

ActiveRecord::Schema.define(version: 2019_12_28_054725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_dates", force: :cascade do |t|
    t.bigint "match_id"
    t.integer "timeframe", default: 0
    t.date "date", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_candidate_dates_on_match_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "user_id"
    t.string "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_chats_on_match_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "match_requests", force: :cascade do |t|
    t.bigint "from_user_id", null: false
    t.bigint "to_user_id", null: false
    t.bigint "user_restaurant_id"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_user_id"], name: "index_match_requests_on_from_user_id"
    t.index ["to_user_id"], name: "index_match_requests_on_to_user_id"
    t.index ["user_restaurant_id"], name: "index_match_requests_on_user_restaurant_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "match_request_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_request_id"], name: "index_matches_on_match_request_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "request_user_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "candidate_date_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_date_id"], name: "index_reservations_on_candidate_date_id"
    t.index ["match_id"], name: "index_reservations_on_match_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.string "image_url", null: false
    t.string "area", null: false
    t.string "tel", null: false
    t.integer "price", null: false
    t.string "address", null: false
    t.string "tabelog_url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_blocks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "report_user_id", null: false
    t.string "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_blocks_on_user_id"
  end

  create_table "user_images", force: :cascade do |t|
    t.bigint "user_id"
    t.string "image_yrl", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_images_on_user_id"
  end

  create_table "user_restaurants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_user_restaurants_on_restaurant_id"
    t.index ["user_id"], name: "index_user_restaurants_on_user_id"
  end

  create_table "user_verifications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "image_url", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_verifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.integer "gender", null: false
    t.string "introduction"
    t.string "origin"
    t.string "language"
    t.integer "height"
    t.string "school"
    t.string "work"
    t.integer "drink"
    t.boolean "cigarette"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "candidate_dates", "matches"
  add_foreign_key "chats", "matches"
  add_foreign_key "chats", "users"
  add_foreign_key "match_requests", "user_restaurants"
  add_foreign_key "match_requests", "users", column: "from_user_id"
  add_foreign_key "match_requests", "users", column: "to_user_id"
  add_foreign_key "matches", "match_requests"
  add_foreign_key "notifications", "users"
  add_foreign_key "reservations", "candidate_dates"
  add_foreign_key "reservations", "matches"
  add_foreign_key "user_blocks", "users"
  add_foreign_key "user_images", "users"
  add_foreign_key "user_restaurants", "restaurants"
  add_foreign_key "user_restaurants", "users"
  add_foreign_key "user_verifications", "users"
end
