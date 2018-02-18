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

ActiveRecord::Schema.define(version: 20180218000253) do

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.string "salt"
    t.string "email"
    t.string "phone"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.integer "invoices_id"
    t.integer "owed"
    t.integer "payments_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoices_id"], name: "index_employees_on_invoices_id"
    t.index ["payments_id"], name: "index_employees_on_payments_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "invoice_num"
    t.integer "techs_on_job_id"
    t.integer "customer_id"
    t.datetime "start_job"
    t.datetime "end_job"
    t.integer "hours"
    t.integer "parts_used_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
    t.index ["parts_used_id"], name: "index_invoices_on_parts_used_id"
    t.index ["techs_on_job_id"], name: "index_invoices_on_techs_on_job_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "pay_date"
    t.integer "paid_to_id"
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paid_to_id"], name: "index_payments_on_paid_to_id"
  end

end
