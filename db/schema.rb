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

ActiveRecord::Schema.define(version: 2023_04_19_012757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "title", null: false
    t.float "price", null: false
    t.integer "status", null: false
    t.integer "frequency", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_subscriptions_on_customer_id"
  end

  create_table "tea_subscriptions", force: :cascade do |t|
    t.bigint "tea_id"
    t.bigint "subscription_id"
    t.index ["subscription_id"], name: "index_tea_subscriptions_on_subscription_id"
    t.index ["tea_id"], name: "index_tea_subscriptions_on_tea_id"
  end

  create_table "teas", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "brew_time", null: false
  end

  add_foreign_key "subscriptions", "customers"
  add_foreign_key "tea_subscriptions", "subscriptions"
  add_foreign_key "tea_subscriptions", "teas"
end
