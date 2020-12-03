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

ActiveRecord::Schema.define(version: 2020_12_03_070718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "content"
    t.string "location"
    t.date "date"
    t.time "time"
    t.string "transportation"
    t.string "lodging"
    t.bigint "trip_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_activities_on_trip_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.integer "amount"
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "guest_id"
    t.index ["trip_id"], name: "index_budgets_on_trip_id"
  end

  create_table "guests", force: :cascade do |t|
    t.boolean "is_admin"
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["trip_id"], name: "index_guests_on_trip_id"
    t.index ["user_id"], name: "index_guests_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.float "amount"
    t.string "category"
    t.text "content"
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.index ["trip_id"], name: "index_payments_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "activities", "trips"
  add_foreign_key "activities", "users"
  add_foreign_key "budgets", "trips"
  add_foreign_key "guests", "trips"
  add_foreign_key "guests", "users"
  add_foreign_key "payments", "trips"
end
