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

ActiveRecord::Schema.define(version: 20170728060235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entities", force: :cascade do |t|
    t.string "entity_type"
    t.float "salience"
    t.string "name"
    t.bigint "text_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["text_id"], name: "index_entities_on_text_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.float "score"
    t.float "magnitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string "provider"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account"
    t.float "score"
    t.float "magnitude"
    t.index ["person_id"], name: "index_sources_on_person_id"
  end

  create_table "texts", force: :cascade do |t|
    t.text "body"
    t.float "score"
    t.float "magnitude"
    t.bigint "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "text_type"
    t.index ["source_id"], name: "index_texts_on_source_id"
  end

  add_foreign_key "entities", "texts"
  add_foreign_key "sources", "people"
  add_foreign_key "texts", "sources"
end
