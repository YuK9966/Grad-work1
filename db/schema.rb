# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_12_25_045211) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "colors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color_code", null: false
    t.index ["name"], name: "index_colors_on_name", unique: true
  end

  create_table "log_colors", force: :cascade do |t|
    t.bigint "color_id", null: false
    t.bigint "naillog_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_log_colors_on_color_id"
    t.index ["naillog_id"], name: "index_log_colors_on_naillog_id"
  end

  create_table "log_images", force: :cascade do |t|
    t.bigint "naillog_id", null: false
    t.string "image_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_url"], name: "index_log_images_on_image_url", unique: true
    t.index ["naillog_id"], name: "index_log_images_on_naillog_id"
  end

  create_table "log_nails", force: :cascade do |t|
    t.bigint "nail_item_id", null: false
    t.bigint "naillog_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nail_item_id"], name: "index_log_nails_on_nail_item_id"
    t.index ["naillog_id"], name: "index_log_nails_on_naillog_id"
  end

  create_table "nail_items", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.bigint "product_id", null: false
    t.bigint "prod_color_id", null: false
    t.bigint "colors_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id", "product_id", "prod_color_id"], name: "index_nail_items_SKU", unique: true
    t.index ["brand_id"], name: "index_nail_items_on_brand_id"
    t.index ["colors_id"], name: "index_nail_items_on_colors_id"
    t.index ["prod_color_id"], name: "index_nail_items_on_prod_color_id"
    t.index ["product_id"], name: "index_nail_items_on_product_id"
  end

  create_table "nail_stocks", force: :cascade do |t|
    t.bigint "nail_item_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nail_item_id", "user_id"], name: "index_nail_stocks_on_nail_item_id_and_user_id", unique: true
    t.index ["nail_item_id"], name: "index_nail_stocks_on_nail_item_id"
    t.index ["user_id"], name: "index_nail_stocks_on_user_id"
  end

  create_table "naillogs", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.date "nailed_date"
    t.string "design_url"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "下書き", null: false
    t.string "nail_shape"
    t.string "main_image"
    t.index ["main_image"], name: "index_naillogs_on_main_image", unique: true
    t.index ["user_id"], name: "index_naillogs_on_user_id"
  end

  create_table "prod_colors", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_prod_colors_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.integer "age_group"
    t.string "gender"
    t.date "started_nail_on"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "log_colors", "colors"
  add_foreign_key "log_colors", "naillogs"
  add_foreign_key "log_images", "naillogs"
  add_foreign_key "log_nails", "nail_items"
  add_foreign_key "log_nails", "naillogs"
  add_foreign_key "nail_items", "brands"
  add_foreign_key "nail_items", "colors", column: "colors_id"
  add_foreign_key "nail_items", "prod_colors"
  add_foreign_key "nail_items", "products"
  add_foreign_key "nail_stocks", "nail_items"
  add_foreign_key "nail_stocks", "users"
  add_foreign_key "naillogs", "users"
  add_foreign_key "prod_colors", "products"
  add_foreign_key "products", "brands"
end
