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

ActiveRecord::Schema.define(version: 20151201042636) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "released_date"
    t.string   "trailer_link"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "online"
  end

  add_index "films", ["category_id"], name: "index_films_on_category_id"

  create_table "posters", force: :cascade do |t|
    t.string   "title"
    t.string   "image_url"
    t.integer  "film_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posters", ["film_id"], name: "index_posters_on_film_id"

end
