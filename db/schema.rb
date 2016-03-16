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

ActiveRecord::Schema.define(version: 20160316143911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["company_id"], name: "index_categories_on_company_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.float    "to_usd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "filename"
    t.string   "body"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "body"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "logos", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.boolean  "delta"
    t.text     "index_field"
    t.integer  "company_id"
    t.integer  "currency_id"
    t.integer  "logo_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.string   "trade_type",                default: "buy"
    t.string   "title"
    t.string   "color"
    t.integer  "category_id"
    t.integer  "product_id"
    t.float    "weight"
    t.float    "weight_etalon"
    t.integer  "weight_dimension_id",       default: 1
    t.float    "min_weight",                default: 0.0
    t.float    "min_weight_etalon"
    t.integer  "min_weight_dimension_id",   default: 1
    t.float    "price"
    t.float    "price_etalon"
    t.integer  "price_weight_dimension_id", default: 1
    t.float    "deviation",                 default: 0.0
    t.text     "description"
    t.float    "lat"
    t.float    "lng"
    t.string   "address"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "city"
    t.integer  "user_id"
    t.string   "status",                    default: "new"
  end

  add_index "positions", ["category_id"], name: "index_positions_on_category_id", using: :btree
  add_index "positions", ["company_id"], name: "index_positions_on_company_id", using: :btree
  add_index "positions", ["product_id"], name: "index_positions_on_product_id", using: :btree
  add_index "positions", ["trade_type"], name: "index_positions_on_trade_type", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "title"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "products", ["company_id"], name: "index_products_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "logo_id"
    t.string   "name"
    t.string   "phone"
    t.string   "website"
    t.string   "email"
    t.string   "locale"
    t.integer  "position_ids",    default: [],              array: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.datetime "last_created_at"
    t.boolean  "admin"
  end

  create_table "weight_dimensions", force: :cascade do |t|
    t.string   "name"
    t.float    "convert"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
