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

ActiveRecord::Schema.define(version: 2019_09_30_152110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string "name", null: false
    t.string "price"
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_dishes_on_vendor_id"
  end

  create_table "lunch_dishes", force: :cascade do |t|
    t.bigint "lunch_id", null: false
    t.bigint "dish_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_lunch_dishes_on_dish_id"
    t.index ["lunch_id"], name: "index_lunch_dishes_on_lunch_id"
  end

  create_table "lunches", force: :cascade do |t|
    t.string "date"
    t.string "occasion"
    t.string "description"
    t.bigint "user_id", null: false
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_users_on_vendor_id"
    t.index ["vendor_id"], name: "index_lunches_on_vendor_id"
  end

  create_table "names", force: :cascade do |t|
    t.string "description"
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_names_on_vendor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "birthdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.datetime "last_catered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "dishes", "vendors"
  add_foreign_key "lunch_dishes", "dishes"
  add_foreign_key "lunch_dishes", "lunches"
  add_foreign_key "lunches", "users"
  add_foreign_key "lunches", "vendors"
  add_foreign_key "names", "vendors"
end
