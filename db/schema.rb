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

ActiveRecord::Schema[7.0].define(version: 2023_05_13_190222) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.text "link_url"
    t.text "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "product_features", force: :cascade do |t|
    t.string "feature_name"
    t.string "feature_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.float "price"
    t.string "condition"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "products_features", force: :cascade do |t|
    t.bigint "product_feature_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_feature_id"], name: "index_products_features_on_product_feature_id"
    t.index ["product_id"], name: "index_products_features_on_product_id"
  end

  create_table "products_pictures", force: :cascade do |t|
    t.bigint "picture_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["picture_id"], name: "index_products_pictures_on_picture_id"
    t.index ["product_id"], name: "index_products_pictures_on_product_id"
  end

  create_table "products_tags", force: :cascade do |t|
    t.bigint "product_tag_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_tags_on_product_id"
    t.index ["product_tag_id"], name: "index_products_tags_on_product_tag_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.text "location"
    t.string "user_type"
    t.string "mobile_number"
    t.string "email_address"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pictures", "users"
  add_foreign_key "products", "users"
  add_foreign_key "products_features", "product_features"
  add_foreign_key "products_features", "products"
  add_foreign_key "products_pictures", "pictures"
  add_foreign_key "products_pictures", "products"
  add_foreign_key "products_tags", "product_tags"
  add_foreign_key "products_tags", "products"
end
