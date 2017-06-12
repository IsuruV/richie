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

ActiveRecord::Schema.define(version: 20170612203831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "amount"
    t.string  "bank_number"
    t.string  "routing_number"
  end

  create_table "etfs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "following_id", null: false
    t.integer  "follower_id",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "group_investments", force: :cascade do |t|
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "etf_id"
  end

  create_table "group_memberships", force: :cascade do |t|
    t.string   "member_type"
    t.integer  "member_id",       null: false
    t.string   "group_type"
    t.integer  "group_id"
    t.string   "group_name"
    t.string   "membership_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_name"], name: "index_group_memberships_on_group_name", using: :btree
    t.index ["group_type", "group_id"], name: "index_group_memberships_on_group_type_and_group_id", using: :btree
    t.index ["member_type", "member_id"], name: "index_group_memberships_on_member_type_and_member_id", using: :btree
  end

  create_table "group_requests", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "approved"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "description"
    t.boolean  "active",      default: true
  end

  create_table "individual_investments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "etf_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suggestions", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "etf_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.integer  "age"
    t.string   "image"
    t.string   "email"
    t.string   "address"
    t.string   "occupation"
    t.string   "phone"
    t.string   "net_worth"
    t.string   "annual_income"
    t.string   "ssn"
    t.string   "bank_reference"
    t.string   "citizenship"
    t.string   "investment_objectives"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fd_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
