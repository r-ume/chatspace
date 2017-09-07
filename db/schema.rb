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

ActiveRecord::Schema.define(version: 20161102133716) do

  create_table "chat_group_users", force: :cascade do |t|
    t.integer  "chat_group_id", limit: 4, null: false
    t.integer  "user_id",       limit: 4, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "chat_group_users", ["chat_group_id", "user_id"], name: "index_chat_groups_users_on_chat_group_id_and_user_id", using: :btree
  add_index "chat_group_users", ["chat_group_id", "user_id"], name: "uk_chat_group_users_on_chat_group_id_and_user_id", unique: true, using: :btree
  add_index "chat_group_users", ["user_id"], name: "fk_rails_689bd81e0d", using: :btree

  create_table "chat_groups", force: :cascade do |t|
    t.string   "name",       limit: 255, default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "chat_groups", ["name"], name: "index_chat_groups_name", using: :btree
  add_index "chat_groups", ["name"], name: "uk_chat_groups_name", unique: true, using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body",          limit: 65535,              null: false
    t.integer  "chat_group_id", limit: 4,     default: 0,  null: false
    t.integer  "user_id",       limit: 4,     default: 0,  null: false
    t.string   "image",         limit: 255,   default: "", null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "messages", ["chat_group_id", "user_id"], name: "index_messages_on_chat_group_id_and_user_id", using: :btree
  add_index "messages", ["user_id"], name: "fk_rails_273a25a7a6", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255, default: "", null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "chat_group_users", "chat_groups"
  add_foreign_key "chat_group_users", "users"
  add_foreign_key "messages", "chat_groups"
  add_foreign_key "messages", "users"
end
