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

ActiveRecord::Schema.define(version: 20170713030431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "amount"
    t.string  "bank_number"
    t.string  "routing_number"
  end

  create_table "approvers", force: :cascade do |t|
    t.integer "user_id"
    t.string  "message"
    t.boolean "approved"
    t.integer "group_investment_request_id"
    t.decimal "amount"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "question_id"
    t.string  "choice"
  end

  create_table "etfs", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "risk_level"
    t.string   "holdings"
    t.string   "investment_name"
    t.string   "ticker"
    t.string   "last_price"
    t.string   "dividend_yield"
    t.string   "expense_ratio"
    t.string   "website_link"
    t.text     "description"
    t.string   "name"
    t.string   "fiduty_name"
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "following_id", null: false
    t.integer  "follower_id",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "group_investment_requests", force: :cascade do |t|
    t.integer  "requester_id"
    t.integer  "group_id"
    t.integer  "etf_id"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "group_investments", force: :cascade do |t|
    t.integer  "group_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "etf_id"
    t.decimal  "bought_price"
    t.decimal  "weight"
    t.integer  "group_investment_request_id"
    t.decimal  "group_amount"
  end

  create_table "group_requests", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "message"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "approved",       default: false
    t.boolean  "requested"
    t.decimal  "minimum_amount", default: "0.0"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "description"
    t.boolean  "active",         default: true
    t.boolean  "public"
    t.decimal  "minimum_amount"
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

  create_table "questions", force: :cascade do |t|
    t.string "question"
  end

  create_table "suggestions", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "etf_id"
  end

  create_table "user_choice_questions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.integer "choice_id"
    t.string  "open_ended"
  end

  create_table "user_groups", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "memeber_type"
    t.decimal  "deposited_amount", default: "0.0"
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
    t.string   "access_token"
    t.decimal  "amount"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
