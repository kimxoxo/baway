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

ActiveRecord::Schema.define(:version => 20140727153038) do

  create_table "budgets", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "status"
    t.integer  "seller_id"
    t.integer  "architect_id"
    t.text     "observations"
    t.text     "instalation_observations"
    t.decimal  "discount"
    t.boolean  "freight"
    t.boolean  "instalation"
    t.decimal  "initial_payment"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.boolean  "deleted"
    t.boolean  "instant_payment"
    t.decimal  "instant_payment_discount"
    t.boolean  "show_hidden_products"
  end

  create_table "budgets_products", :force => true do |t|
    t.integer "budget_id"
    t.integer "product_id"
    t.string  "house_area"
    t.decimal "quantity"
    t.integer "days_to_delivery"
    t.decimal "freight"
    t.decimal "height"
    t.decimal "width"
    t.boolean "active"
    t.integer "request_id"
    t.decimal "computed_price"
    t.string  "product_observations"
    t.integer "product_type"
    t.decimal "up"
    t.boolean "show"
    t.integer "pair_id"
    t.integer "unit"
  end

  create_table "curtains", :force => true do |t|
    t.integer  "budgets_product_id"
    t.decimal  "window_width"
    t.decimal  "window_height"
    t.integer  "window_number_parts"
    t.integer  "wave_factor"
    t.decimal  "fabric_width"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
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

  create_table "delivery_options", :force => true do |t|
    t.integer  "budget_id"
    t.string   "name"
    t.boolean  "option1"
    t.string   "option1_label"
    t.boolean  "option2"
    t.string   "option2_label"
    t.boolean  "option3"
    t.string   "option3_label"
    t.boolean  "option4"
    t.string   "option4_label"
    t.text     "observations"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "payment_conditions", :force => true do |t|
    t.integer  "budget_id"
    t.integer  "num_monthly_payments"
    t.boolean  "active"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "supplier_id"
    t.text     "description"
    t.string   "brand"
    t.string   "code"
    t.decimal  "supplier_price"
    t.decimal  "ipi"
    t.integer  "ncm"
    t.decimal  "width"
    t.integer  "product_type"
    t.decimal  "markup"
    t.decimal  "supplier_table_discount"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.boolean  "visible"
  end

  create_table "requests", :force => true do |t|
    t.integer  "budget_id"
    t.decimal  "request_number"
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
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.integer  "role"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "mobile"
    t.boolean  "deleted"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
