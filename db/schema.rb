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

ActiveRecord::Schema.define(version: 20150514143347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer  "stylist_id"
    t.integer  "client_id"
    t.string   "app_day"
    t.string   "app_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "availability", force: :cascade do |t|
    t.integer "stylist_id"
    t.string  "monday"
    t.string  "tuesday"
    t.string  "wednesday"
    t.string  "thursday"
    t.string  "friday"
    t.string  "saturday"
    t.string  "sunday"
  end

  add_index "availability", ["stylist_id"], name: "index_availability_on_stylist_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string "client_name"
  end

  create_table "stylists", force: :cascade do |t|
    t.string "style_name"
  end

end
