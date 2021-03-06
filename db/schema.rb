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

ActiveRecord::Schema.define(version: 20140515144426) do

  create_table "book_tags", force: true do |t|
    t.integer  "book_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "year"
    t.string   "mobi"
    t.string   "pdf"
    t.string   "epub"
    t.integer  "page_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover"
    t.boolean  "incomplete"
  end

  create_table "organizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "tags", force: true do |t|
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "format"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id"
    t.string   "filename"
    t.boolean  "incomplete"
  end

  create_table "user_books", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.string   "format"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "token"
  end

end
