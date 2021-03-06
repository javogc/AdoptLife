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

ActiveRecord::Schema.define(version: 20151116084934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_attendants", force: :cascade do |t|
    t.integer  "animal_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "animal_attendants", ["animal_id"], name: "index_animal_attendants_on_animal_id", using: :btree
  add_index "animal_attendants", ["event_id"], name: "index_animal_attendants_on_event_id", using: :btree

  create_table "animals", force: :cascade do |t|
    t.string   "name"
    t.string   "photo"
    t.string   "species"
    t.text     "details"
    t.string   "size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "rescuer_id"
    t.integer  "adoptant_id"
  end

  add_index "animals", ["adoptant_id"], name: "index_animals_on_adoptant_id", using: :btree
  add_index "animals", ["rescuer_id"], name: "index_animals_on_rescuer_id", using: :btree

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookmarks", ["animal_id"], name: "index_bookmarks_on_animal_id", using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_organizers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_organizers", ["event_id"], name: "index_event_organizers_on_event_id", using: :btree
  add_index "event_organizers", ["user_id"], name: "index_event_organizers_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.date     "date"
    t.string   "name"
    t.string   "addrline1"
    t.string   "addrline2"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "status"
    t.integer  "animal_id"
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "date"
    t.time     "time"
    t.string   "location"
  end

  add_index "requests", ["animal_id"], name: "index_requests_on_animal_id", using: :btree
  add_index "requests", ["recipient_id"], name: "index_requests_on_recipient_id", using: :btree
  add_index "requests", ["sender_id"], name: "index_requests_on_sender_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "fname"
    t.string   "lname"
    t.string   "addrline1"
    t.string   "addrline2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zipcode"
    t.integer  "available_time"
    t.integer  "square_meters"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "password"
  end

  add_foreign_key "animal_attendants", "animals"
  add_foreign_key "animal_attendants", "events"
  add_foreign_key "bookmarks", "animals"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "event_organizers", "events"
  add_foreign_key "event_organizers", "users"
end
