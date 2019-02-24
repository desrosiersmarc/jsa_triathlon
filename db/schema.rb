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

ActiveRecord::Schema.define(version: 20190224104536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.time "start_time"
    t.time "end_time"
    t.string "location"
    t.string "link"
    t.string "content"
    t.bigint "user_id"
    t.bigint "article_type_id", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.boolean "active", default: true
    t.index ["article_type_id"], name: "index_articles_on_article_type_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject"
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.datetime "date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "like"
    t.string "photo"
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.bigint "size_id", default: 0
    t.string "description"
    t.integer "price"
    t.integer "stock"
    t.string "sex", default: "Unisex"
    t.bigint "sport_type_id", default: 1
    t.bigint "product_type_id", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.boolean "active"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
    t.index ["size_id"], name: "index_products_on_size_id"
    t.index ["sport_type_id"], name: "index_products_on_sport_type_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sport_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.date "birthday"
    t.string "mobil_phone"
    t.string "photo"
    t.string "role"
    t.string "profil"
    t.boolean "office_member"
    t.boolean "coach"
    t.boolean "display_profil", default: true
    t.boolean "member"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "article_types"
  add_foreign_key "articles", "users"
  add_foreign_key "clubs", "users"
  add_foreign_key "pictures", "users"
  add_foreign_key "products", "product_types"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "sport_types"
  add_foreign_key "products", "users"
end
