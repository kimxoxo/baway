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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131029180444) do

  create_table "budgets", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "status"
    t.integer  "seller_id"
    t.integer  "arquitect_id"
    t.integer  "payment_condition_id"
    t.text     "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "budgets_products", :force => true do |t|
    t.integer "budget_id"
    t.integer "product_id"
    t.integer "quantity"
    t.integer "markup"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "street"
    t.integer  "street_number"
    t.string   "tax_number"
    t.string   "neighbourhood"
    t.string   "postal_code"
    t.string   "address_complement"
    t.integer  "tax_number_type"
    t.string   "landline"
    t.string   "mobile"
    t.string   "city"
    t.string   "rg"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "customers", ["email"], :name => "index_customers_on_email", :unique => true
  add_index "customers", ["tax_number"], :name => "index_customers_on_tax_number", :unique => true

  create_table "payment_conditions", :force => true do |t|
    t.string   "name"
    t.float    "discount"
    t.integer  "num_monthly_payments"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "supplier_id"
    t.text     "description"
    t.string   "brand"
    t.string   "code"
    t.decimal  "supplier_price"
    t.decimal  "ipi"
    t.integer  "ncm"
    t.decimal  "width"
    t.boolean  "um"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "street"
    t.string   "street_number"
    t.string   "neighbourhood"
    t.string   "city"
    t.string   "address_complement"
    t.string   "cnpj"
    t.string   "postal_code"
    t.string   "landline"
    t.string   "mobile"
    t.string   "ie"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "landline"
    t.string   "mobile"
    t.integer  "role"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
