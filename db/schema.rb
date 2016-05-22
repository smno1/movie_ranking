# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160522135930) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cinema_showings", force: :cascade do |t|
    t.integer  "cinema_id"
    t.integer  "film_id"
    t.date     "on_date"
    t.date     "off_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cinema_showings", ["cinema_id"], name: "index_cinema_showings_on_cinema_id"
  add_index "cinema_showings", ["film_id"], name: "index_cinema_showings_on_film_id"

  create_table "cinemas", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dislikes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "film_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dislikes", ["film_id"], name: "index_dislikes_on_film_id"
  add_index "dislikes", ["user_id"], name: "index_dislikes_on_user_id"

  create_table "films", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "released_date"
    t.string   "trailer_link"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "online"
    t.string   "duration"
  end

  create_table "films_categories", force: :cascade do |t|
    t.integer  "film_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "films_categories", ["category_id"], name: "index_films_categories_on_category_id"
  add_index "films_categories", ["film_id"], name: "index_films_categories_on_film_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "film_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["film_id"], name: "index_likes_on_film_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "posters", force: :cascade do |t|
    t.string   "title"
    t.string   "image_url"
    t.integer  "film_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posters", ["film_id"], name: "index_posters_on_film_id"

  create_table "screen_dislikes", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "screen_id"
    t.integer  "film_id"
  end

  add_index "screen_dislikes", ["film_id"], name: "index_screen_dislikes_on_film_id"
  add_index "screen_dislikes", ["screen_id"], name: "index_screen_dislikes_on_screen_id"
  add_index "screen_dislikes", ["user_id"], name: "index_screen_dislikes_on_user_id"

  create_table "screen_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "screen_id"
    t.integer  "film_id"
  end

  add_index "screen_likes", ["film_id"], name: "index_screen_likes_on_film_id"
  add_index "screen_likes", ["screen_id"], name: "index_screen_likes_on_screen_id"
  add_index "screen_likes", ["user_id"], name: "index_screen_likes_on_user_id"

  create_table "screens", force: :cascade do |t|
    t.string   "number"
    t.integer  "cinema_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "screens", ["cinema_id"], name: "index_screens_on_cinema_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "auth_token",             default: ""
    t.integer  "cinema_id"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true
  add_index "users", ["cinema_id"], name: "index_users_on_cinema_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
