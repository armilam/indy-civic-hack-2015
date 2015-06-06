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

ActiveRecord::Schema.define(version: 20150606174343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.integer "student_id"
    t.string  "wl_building"
    t.string  "wl_program"
    t.integer "status"
    t.integer "priority"
    t.integer "random"
    t.string  "current_building"
    t.string  "current_program"
    t.integer "current_status"
    t.integer "select_number"
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "method"
    t.integer  "user_id"
    t.integer  "admin_id"
    t.string   "description"
    t.datetime "happened_at"
  end

  create_table "issues", force: :cascade do |t|
    t.integer "student_id"
    t.integer "application_id"
    t.integer "owner_admin_id"
    t.string  "description"
    t.integer "status"
  end

  create_table "students", force: :cascade do |t|
    t.integer "ips_id"
    t.string  "first_name"
    t.string  "middle_name"
    t.string  "last_name"
    t.date    "birthdate"
    t.string  "address"
    t.integer "grade"
    t.string  "school"
  end

  create_table "user_students", force: :cascade do |t|
    t.integer "user_id"
    t.integer "student_id"
    t.string  "relationship"
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "phone"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
