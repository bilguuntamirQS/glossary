# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_08_022526) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.text "category_name"
    t.text "category_name_mn"
    t.bigint "category_id"
    t.bigint "user_id", null: false
    t.datetime "updated", precision: nil
    t.datetime "deleted", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "translations", force: :cascade do |t|
    t.bigint "word_id", null: false
    t.text "translation"
    t.text "term"
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.datetime "updated", precision: nil
    t.datetime "deleted", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_translations_on_category_id"
    t.index ["user_id"], name: "index_translations_on_user_id"
    t.index ["word_id"], name: "index_translations_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "user_name"
    t.text "email"
    t.text "password"
    t.integer "permission"
    t.datetime "updated", precision: nil
    t.datetime "deleted", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "word_categories", force: :cascade do |t|
    t.bigint "word_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_word_categories_on_category_id"
    t.index ["word_id"], name: "index_word_categories_on_word_id"
  end

  create_table "words", force: :cascade do |t|
    t.text "word"
    t.bigint "user_id", null: false
    t.datetime "updated", precision: nil
    t.datetime "deleted", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_words_on_user_id" 
  end

  add_foreign_key "categories", "categories"
  add_foreign_key "categories", "users"
  add_foreign_key "translations", "categories"
  add_foreign_key "translations", "users"
  add_foreign_key "translations", "words"
  add_foreign_key "word_categories", "categories"
  add_foreign_key "word_categories", "words"
  add_foreign_key "words", "users"
end