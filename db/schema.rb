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

ActiveRecord::Schema.define(version: 2018_09_15_044921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_count", force: :cascade do |t|
    t.bigint "review_id"
    t.bigint "talk_id"
    t.bigint "total_access_count"
    t.bigint "monthly_access_count"
    t.bigint "weekly_access_count"
    t.bigint "daily_access_count"
    t.datetime "posted_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_access_count_on_review_id"
    t.index ["talk_id"], name: "index_access_count_on_talk_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_images", force: :cascade do |t|
    t.bigint "character_id"
    t.text "image_info", null: false
    t.text "image_url", null: false
    t.datetime "registered_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_images_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.datetime "birthday", null: false
    t.text "like", null: false
    t.text "dislike", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_genres_on_category_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "sender_info", null: false
    t.integer "classification", null: false
    t.text "content", null: false
    t.datetime "reception_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registered_genres", force: :cascade do |t|
    t.bigint "review_id"
    t.bigint "talk_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_registered_genres_on_genre_id"
    t.index ["review_id"], name: "index_registered_genres_on_review_id"
    t.index ["talk_id"], name: "index_registered_genres_on_talk_id"
  end

  create_table "review_images", force: :cascade do |t|
    t.bigint "review_id"
    t.integer "image_number", null: false
    t.text "image_url", null: false
    t.datetime "registered_date", null: false
    t.boolean "title_image_flag", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_review_images_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name", null: false
    t.text "content", null: false
    t.datetime "season", null: false
    t.integer "score", null: false
    t.datetime "posted_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_reviews_on_category_id"
  end

  create_table "site_images", force: :cascade do |t|
    t.text "image_info", null: false
    t.text "image_url", null: false
    t.datetime "registered_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talks", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name", null: false
    t.text "content", null: false
    t.datetime "posted_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_talks_on_category_id"
  end

  create_table "used_characters", id: false, force: :cascade do |t|
    t.bigint "review_id"
    t.bigint "talk_id"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_used_characters_on_character_id"
    t.index ["review_id"], name: "index_used_characters_on_review_id"
    t.index ["talk_id"], name: "index_used_characters_on_talk_id"
  end

  add_foreign_key "access_count", "reviews"
  add_foreign_key "access_count", "talks"
  add_foreign_key "character_images", "characters"
  add_foreign_key "genres", "categories"
  add_foreign_key "registered_genres", "genres"
  add_foreign_key "registered_genres", "reviews"
  add_foreign_key "registered_genres", "talks"
  add_foreign_key "review_images", "reviews"
  add_foreign_key "reviews", "categories"
  add_foreign_key "talks", "categories"
  add_foreign_key "used_characters", "characters"
  add_foreign_key "used_characters", "reviews"
  add_foreign_key "used_characters", "talks"
end
