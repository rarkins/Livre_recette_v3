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

ActiveRecord::Schema.define(version: 20121030124757365) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", id: :serial, force: :cascade do |t|
    t.string "attachinariable_type"
    t.integer "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "nom", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_recettes", id: false, force: :cascade do |t|
    t.integer "recette_id"
    t.integer "category_id"
    t.index ["recette_id", "category_id"], name: "index_categories_recettes_on_recette_id_and_category_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "content", null: false
    t.integer "user_id", null: false
    t.integer "recette_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_passwords", id: :serial, force: :cascade do |t|
    t.string "encrypted_password", limit: 128, null: false
    t.string "password_salt"
    t.integer "password_archivable_id", null: false
    t.string "password_archivable_type", null: false
    t.datetime "created_at"
    t.index ["password_archivable_type", "password_archivable_id"], name: "index_password_archivable"
  end

  create_table "rating_caches", id: :serial, force: :cascade do |t|
    t.string "cacheable_type"
    t.integer "cacheable_id"
    t.float "avg", null: false
    t.integer "qty", null: false
    t.string "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"
  end

  create_table "recettes", id: :serial, force: :cascade do |t|
    t.string "titre", null: false
    t.string "source"
    t.integer "user_id", null: false
    t.string "preparation", null: false
    t.string "cuisson"
    t.string "marinage"
    t.string "portion"
    t.text "ingredient", null: false
    t.text "instruction", null: false
    t.text "note"
    t.string "accompagnement"
    t.string "vin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "admin", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "password_changed_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
