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

ActiveRecord::Schema.define(version: 20180314151650) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.integer "invoices_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoices_id"], name: "index_customers_on_invoices_id"
  end

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

  create_table "expenses", force: :cascade do |t|
    t.integer "owner_id"
    t.boolean "recurring"
    t.date "due"
    t.integer "pay_to_id"
    t.integer "pay_from_id"
    t.decimal "amount"
    t.integer "status_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_expenses_on_owner_id"
    t.index ["pay_from_id"], name: "index_expenses_on_pay_from_id"
    t.index ["pay_to_id"], name: "index_expenses_on_pay_to_id"
    t.index ["status_id"], name: "index_expenses_on_status_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.integer "item_type_id"
    t.string "name"
    t.text "description"
    t.decimal "cost"
    t.decimal "retail"
    t.decimal "markup"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_type_id"], name: "index_inventory_items_on_item_type_id"
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

  create_table "item_locations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "invoice_id"
    t.date "date"
    t.integer "status_id"
    t.datetime "scheduled_for"
    t.datetime "completed_on"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_jobs_on_customer_id"
    t.index ["invoice_id"], name: "index_jobs_on_invoice_id"
    t.index ["status_id"], name: "index_jobs_on_status_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "pay_date"
    t.integer "paid_to_id"
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paid_to_id"], name: "index_payments_on_paid_to_id"
  end

  create_table "settings_data", force: :cascade do |t|
    t.string "name"
    t.integer "type_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_settings_data_on_type_id"
  end

  create_table "status_data", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "truck_inventories", force: :cascade do |t|
    t.integer "inventory_item_id"
    t.integer "item_location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_item_id"], name: "index_truck_inventories_on_inventory_item_id"
    t.index ["item_location_id"], name: "index_truck_inventories_on_item_location_id"
  end

end
