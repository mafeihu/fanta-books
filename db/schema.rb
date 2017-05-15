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

ActiveRecord::Schema.define(version: 20170515052109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "books", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade, comment: "公开发行" do |t|
    t.string   "title",                   comment: "书名"
    t.string   "isbn",                    comment: "编号"
    t.string   "external",                comment: "外部编号"
    t.string   "cover",                   comment: "封面"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "download"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_books_on_deleted_at", using: :btree
    t.index ["isbn"], name: "index_books_on_isbn", unique: true, using: :btree
  end

end
