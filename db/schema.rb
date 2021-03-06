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

ActiveRecord::Schema.define(version: 2019_03_04_005740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_slots", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "slot_id", null: false
    t.boolean "open", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["open"], name: "index_person_slots_on_open"
    t.index ["person_id"], name: "index_person_slots_on_person_id"
    t.index ["slot_id"], name: "index_person_slots_on_slot_id"
  end

  create_table "slots", force: :cascade do |t|
    t.datetime "date_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date_time"], name: "index_slots_on_date_time"
  end

  add_foreign_key "person_slots", "people"
  add_foreign_key "person_slots", "slots"
end
