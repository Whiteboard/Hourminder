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

ActiveRecord::Schema.define(version: 20161222173107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boom_award_titles", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "awarded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boom_award_titles", ["user_id"], name: "index_boom_award_titles_on_user_id", using: :btree

  create_table "google_analytics_accounts", force: :cascade do |t|
    t.text     "account_json"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "guild_assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "guild_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "guild_assignments", ["guild_id"], name: "index_guild_assignments_on_guild_id", using: :btree
  add_index "guild_assignments", ["user_id"], name: "index_guild_assignments_on_user_id", using: :btree

  create_table "guilds", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "status_messages", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "status_messages", ["user_id"], name: "index_status_messages_on_user_id", using: :btree

  create_table "user_locations", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_locations", ["user_id"], name: "index_user_locations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "teamgrid_uid"
    t.datetime "birthdate"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "boom_award_titles", "users"
  add_foreign_key "guild_assignments", "guilds"
  add_foreign_key "guild_assignments", "users"
  add_foreign_key "status_messages", "users"
  add_foreign_key "user_locations", "users"
end
