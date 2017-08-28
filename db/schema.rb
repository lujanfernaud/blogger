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

ActiveRecord::Schema.define(version: 20170828070019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "image_file_name"
    t.text     "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "author_id"
    t.integer  "view_count",         default: 0
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.text     "username",         null: false
    t.text     "email",            null: false
    t.text     "crypted_password", null: false
    t.text     "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["email"], name: "index_authors_on_email", unique: true, using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.text     "data_file_name",               null: false
    t.text     "data_content_type"
    t.integer  "data_file_size"
    t.text     "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "author_name"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "bypass_humanizer", default: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["article_id"], name: "index_taggings_on_article_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
