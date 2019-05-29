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

ActiveRecord::Schema.define(version: 20190529145223) do

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
    t.boolean "send_email", default: false
    t.boolean "send_email_admin", default: true
    t.index ["article_type_id"], name: "index_articles_on_article_type_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "authors", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_authors_on_article_id"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject"
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "like", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "article_id"
    t.bigint "user_id"
    t.index ["article_id"], name: "index_likes_on_article_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "article_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_participations_on_article_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
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
    t.integer "stock", default: 1
    t.string "sex", default: "Unisex"
    t.bigint "sport_type_id", default: 1
    t.bigint "product_type_id", default: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.boolean "active", default: true
    t.boolean "sold", default: false
    t.json "photos"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
    t.index ["size_id"], name: "index_products_on_size_id"
    t.index ["sport_type_id"], name: "index_products_on_sport_type_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "like", default: 0
    t.bigint "user_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_reviews_on_article_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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

  create_table "tests", force: :cascade do |t|
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
    t.boolean "notification", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "article_types"
  add_foreign_key "articles", "users"
  add_foreign_key "authors", "articles"
  add_foreign_key "authors", "users"
  add_foreign_key "clubs", "users"
  add_foreign_key "likes", "articles"
  add_foreign_key "likes", "users"
  add_foreign_key "participations", "articles"
  add_foreign_key "participations", "users"
  add_foreign_key "pictures", "users"
  add_foreign_key "products", "product_types"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "sport_types"
  add_foreign_key "products", "users"
  add_foreign_key "reviews", "articles"
  add_foreign_key "reviews", "users"
end
