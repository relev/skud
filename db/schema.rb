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

ActiveRecord::Schema.define(version: 20131021110628) do

  create_table "device_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.integer  "device_type_id"
    t.integer  "user_id"
    t.integer  "session_key"
    t.string   "name"
    t.string   "device_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["device_type_id"], name: "index_devices_on_device_type_id"
  add_index "devices", ["user_id"], name: "index_devices_on_user_id"

  create_table "users", force: true do |t|
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "birth_date"
    t.integer  "lock"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "visits", force: true do |t|
    t.integer  "user_id"
    t.integer  "device_id"
    t.integer  "session_key"
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock"
  end

  add_index "visits", ["device_id"], name: "index_visits_on_device_id"
  add_index "visits", ["user_id"], name: "index_visits_on_user_id"

end
