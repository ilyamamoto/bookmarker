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

ActiveRecord::Schema.define(version: 20140618112342) do

  create_table "keywords", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "keywords", ["name"], name: "index_keywords_on_name", unique: true, using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "keyword_id",                            null: false
    t.integer  "webpage_id",                            null: false
    t.decimal  "significance", precision: 10, scale: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["keyword_id"], name: "index_relationships_on_keyword_id", using: :btree
  add_index "relationships", ["webpage_id", "keyword_id"], name: "index_relationships_on_webpage_id_and_keyword_id", unique: true, using: :btree
  add_index "relationships", ["webpage_id"], name: "index_relationships_on_webpage_id", using: :btree

  create_table "webpages", force: true do |t|
    t.text     "url",        null: false
    t.string   "title",      null: false
    t.text     "html",       null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
