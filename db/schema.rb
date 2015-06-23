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

ActiveRecord::Schema.define(version: 20150623103433) do

  create_table "cable_types", force: :cascade do |t|
    t.integer  "length"
    t.text     "color"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "connector_type_1_id"
    t.integer  "connector_type_2_id"
  end

  create_table "cables", force: :cascade do |t|
    t.integer  "cable_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "cables", ["cable_type_id"], name: "index_cables_on_cable_type_id"

  create_table "connector_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connectors", force: :cascade do |t|
    t.integer  "cable_id"
    t.integer  "end"
    t.integer  "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
