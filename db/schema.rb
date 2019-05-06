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

ActiveRecord::Schema.define(version: 2019_05_03_004415) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.integer "status"
    t.integer "service_type"
    t.integer "payment_method"
    t.datetime "onboard_date"
    t.datetime "offboard_date"
    t.datetime "recent_request_date"
    t.boolean "account_current", default: true
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "ticket_number"
    t.text "request_summary"
    t.text "request_detail"
    t.text "outcome_summary"
    t.text "outcome_detail"
    t.datetime "due"
    t.datetime "resolved"
    t.datetime "last_response"
    t.integer "severity"
    t.integer "status"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_tickets_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "primary_phone"
    t.string "secondary_phone"
    t.boolean "is_primary", default: true
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_users_on_client_id"
  end

end
