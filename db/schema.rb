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

ActiveRecord::Schema.define(version: 2019_12_11_055414) do

  create_table "arrivals", force: :cascade do |t|
    t.integer "stock_count", null: false
    t.datetime "arrive_day", null: false
    t.integer "arrive_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_arrivals_on_deleted_at"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cd_orders", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "cd_id", null: false
    t.integer "total_price", null: false
    t.integer "count", null: false
    t.integer "price", null: false
    t.integer "tax", null: false
    t.integer "disc_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_cd_orders_on_deleted_at"
  end

  create_table "cds", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id", null: false
    t.integer "artist_id", null: false
    t.integer "genre_id", null: false
    t.integer "label_id", null: false
    t.integer "arrive_id", null: false
    t.string "jacket_image_id"
    t.datetime "released_at", null: false
    t.string "price", null: false
    t.integer "stock", null: false
    t.integer "status", null: false
    t.datetime "deleted_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliver_addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "deliver_post_front", null: false
    t.string "deliver_post_back", null: false
    t.string "deliver_prefecture", null: false
    t.text "deliver_town", null: false
    t.integer "deliver_post_number", null: false
    t.string "deliver_condo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.integer "cd_id", null: false
    t.integer "disc_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "shipping_day", null: false
    t.integer "postage", null: false
    t.string "post_front", null: false
    t.string "post_back", null: false
    t.string "prefecture", null: false
    t.text "town", null: false
    t.integer "post_nambar", null: false
    t.string "condo"
    t.integer "payment", null: false
    t.text "shipping_status", null: false
    t.datetime "deleted_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  create_table "songs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "order", null: false
    t.integer "disc_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_cds", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cd_id", null: false
    t.string "disc_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.string "post_front"
    t.string "post_back"
    t.string "prefecture"
    t.text "town"
    t.integer "post_number"
    t.string "condo", default: ""
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
