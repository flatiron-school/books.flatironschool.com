class CreateSchema < ActiveRecord::Migration
  def change
    create_table "book_tags", force: true do |t|
      t.integer  "book_id"
      t.integer  "tag_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end unless table_exists?(:book_tags)

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
    end unless table_exists?(:books)

    create_table "organizations", force: true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "name"
    end unless table_exists?(:organizations)

    create_table "tags", force: true do |t|
      t.string   "label"
      t.datetime "created_at"
      t.datetime "updated_at"
    end unless table_exists?(:tags)

    create_table "types", force: true do |t|
      t.string   "format"
      t.string   "file"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "book_id"
      t.string   "filename"
      t.boolean  "incomplete"
    end unless table_exists?(:types)

    create_table "user_books", force: true do |t|
      t.integer  "user_id"
      t.integer  "book_id"
      t.string   "format"
      t.datetime "created_at"
      t.datetime "updated_at"
    end unless table_exists?(:user_books)

    create_table "users", force: true do |t|
      t.string   "provider"
      t.string   "uid"
      t.string   "nickname"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "admin"
      t.string   "token"
    end unless table_exists?(:users)
  end
end
