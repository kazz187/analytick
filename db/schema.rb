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

ActiveRecord::Schema.define(version: 20140628024709) do

  create_table "charts", force: true do |t|
    t.string   "name"
    t.integer  "db_id"
    t.string   "query"
    t.integer  "timing"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "databases", force: true do |t|
    t.integer  "db_type"
    t.string   "db_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metrics", id: false, force: true do |t|
    t.integer  "chart_id"
    t.datetime "time"
    t.decimal  "value",      precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "metrics", ["chart_id", "time"], name: "index_metrics_on_chart_id_and_time", unique: true, using: :btree

end
