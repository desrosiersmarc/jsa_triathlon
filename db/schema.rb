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

ActiveRecord::Schema[7.1].define(version: 2023_09_13_154654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.datetime "date", precision: nil
    t.time "start_time"
    t.time "end_time"
    t.string "location"
    t.string "link"
    t.string "content"
    t.bigint "user_id"
    t.bigint "article_type_id", default: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "photo"
    t.boolean "active", default: true
    t.boolean "send_email", default: false
    t.boolean "send_email_admin", default: true
    t.boolean "pinned_article"
    t.index ["article_type_id"], name: "index_articles_on_article_type_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "authors", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "article_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["article_id"], name: "index_authors_on_article_id"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "subject"
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "contest_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "abbreviation"
  end

  create_table "d3_contests", force: :cascade do |t|
    t.datetime "date", precision: nil
    t.string "location"
    t.bigint "contest_type_id"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["contest_type_id"], name: "index_d3_contests_on_contest_type_id"
  end

  create_table "d3_results", force: :cascade do |t|
    t.integer "rank"
    t.time "swim"
    t.time "t1"
    t.time "bike"
    t.time "t2"
    t.time "run"
    t.time "total"
    t.bigint "user_id"
    t.bigint "d3_contest_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["d3_contest_id"], name: "index_d3_results_on_d3_contest_id"
    t.index ["user_id"], name: "index_d3_results_on_user_id"
  end

  create_table "licences", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "like", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "article_id"
    t.bigint "user_id"
    t.index ["article_id"], name: "index_likes_on_article_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "send_newsletter", default: false
    t.string "send_newsletter_date", default: "2"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "article_id"
    t.integer "picture_id"
    t.integer "product_id"
    t.boolean "read"
    t.bigint "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "article_id"
    t.integer "status", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["article_id"], name: "index_participations_on_article_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "partners", force: :cascade do |t|
    t.bigint "user_id"
    t.text "name"
    t.text "contact"
    t.integer "offer"
    t.text "website"
    t.text "address"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "photo"
    t.boolean "active"
    t.index ["user_id"], name: "index_partners_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.datetime "date", precision: nil
    t.bigint "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "like"
    t.string "photo"
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "photo"
    t.boolean "active", default: true
    t.boolean "sold", default: false
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["article_id"], name: "index_reviews_on_article_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "sport_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.integer "mailing_group", default: 3
    t.string "strava_profil"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "contactable"
    t.boolean "skill_swim"
    t.boolean "skill_bike"
    t.boolean "skill_run"
    t.boolean "d3"
    t.boolean "d3_manager"
    t.string "gender"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "week_days", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.time "start_hour"
    t.time "end_hour"
    t.bigint "location_id", null: false
    t.bigint "week_day_id", null: false
    t.bigint "sport_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "licence_id"
    t.index ["licence_id"], name: "index_workouts_on_licence_id"
    t.index ["location_id"], name: "index_workouts_on_location_id"
    t.index ["sport_type_id"], name: "index_workouts_on_sport_type_id"
    t.index ["week_day_id"], name: "index_workouts_on_week_day_id"
  end

  add_foreign_key "articles", "article_types"
  add_foreign_key "articles", "users"
  add_foreign_key "authors", "articles"
  add_foreign_key "authors", "users"
  add_foreign_key "clubs", "users"
  add_foreign_key "d3_contests", "contest_types"
  add_foreign_key "d3_results", "d3_contests"
  add_foreign_key "d3_results", "users"
  add_foreign_key "likes", "articles"
  add_foreign_key "likes", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "participations", "articles"
  add_foreign_key "participations", "users"
  add_foreign_key "partners", "users"
  add_foreign_key "pictures", "users"
  add_foreign_key "products", "product_types"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "sport_types"
  add_foreign_key "products", "users"
  add_foreign_key "reviews", "articles"
  add_foreign_key "reviews", "users"
  add_foreign_key "workouts", "licences"
  add_foreign_key "workouts", "locations"
  add_foreign_key "workouts", "sport_types"
  add_foreign_key "workouts", "week_days"
end
