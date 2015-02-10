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

ActiveRecord::Schema.define(version: 20150209234314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orderitems", force: true do |t|
    t.decimal  "cost"
    t.string   "created_by"
    t.date     "created_date"
    t.integer  "rev_id",                limit: 8
    t.integer  "order_local_id",        limit: 8
    t.integer  "productid",             limit: 8
    t.string   "product_name_override"
    t.decimal  "initial_price"
    t.decimal  "price"
    t.decimal  "pure_sales"
    t.integer  "revquantity"
    t.decimal  "actualqty"
    t.date     "updated_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orderitems", ["rev_id"], name: "index_orderitems_on_rev_id", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "sku",         limit: 8
    t.integer  "barcode",     limit: 8
    t.string   "category"
    t.string   "subcategory"
    t.integer  "rewardpoint"
    t.decimal  "cost"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price"
    t.integer  "revid",       limit: 8
  end

  create_table "rev_inventories", force: true do |t|
    t.date     "update_date"
    t.integer  "product"
    t.decimal  "starting_amount"
    t.decimal  "added_amount"
    t.decimal  "threshold"
    t.decimal  "sold_amount"
    t.decimal  "actual_amount"
    t.decimal  "theoretical_ending_inventory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templabels", force: true do |t|
    t.integer  "barcode",    limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
