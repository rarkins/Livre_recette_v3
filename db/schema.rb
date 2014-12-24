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

ActiveRecord::Schema.define(version: 20121030124757370) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type", limit: 255
    t.string   "scope",                limit: 255
    t.string   "public_id",            limit: 255
    t.string   "version",              limit: 255
    t.integer  "width"
    t.integer  "height"
    t.string   "format",               limit: 255
    t.string   "resource_type",        limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "nom",        limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories_recettes", id: false, force: :cascade do |t|
    t.integer "recette_id"
    t.integer "category_id"
  end

  add_index "categories_recettes", ["recette_id", "category_id"], name: "index_categories_recettes_on_recette_id_and_category_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content",    null: false
    t.integer  "user_id",    null: false
    t.integer  "recette_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "old_passwords", force: :cascade do |t|
    t.string   "encrypted_password",       limit: 128, null: false
    t.string   "password_salt",            limit: 255
    t.integer  "password_archivable_id",               null: false
    t.string   "password_archivable_type", limit: 255, null: false
    t.datetime "created_at"
  end

  add_index "old_passwords", ["password_archivable_type", "password_archivable_id"], name: "index_password_archivable", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type", limit: 255
    t.float    "avg",                        null: false
    t.integer  "qty",                        null: false
    t.string   "dimension",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "recettes", force: :cascade do |t|
    t.string   "titre",          limit: 255, null: false
    t.string   "source",         limit: 255
    t.integer  "user_id",                    null: false
    t.string   "preparation",    limit: 255, null: false
    t.string   "cuisson",        limit: 255
    t.string   "marinage",       limit: 255
    t.string   "portion",        limit: 255
    t.text     "ingredient",                 null: false
    t.text     "instruction",                null: false
    t.text     "note"
    t.string   "accompagnement", limit: 255
    t.string   "vin",            limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255,                 null: false
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.boolean  "admin",                              default: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.datetime "password_changed_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
