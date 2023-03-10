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

ActiveRecord::Schema[7.0].define(version: 2023_01_18_121439) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "title"
    t.text "info"
    t.string "of_link"
    t.integer "category_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_brands_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.integer "cuid"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.string "title"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_metrics_on_category_id"
  end

  create_table "photo_proofs", force: :cascade do |t|
    t.jsonb "image_data"
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_photo_proofs_on_review_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "info"
    t.string "of_link"
    t.string "buy_link"
    t.integer "category_id"
    t.bigint "brand_id", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.float "average_rate", default: 0.0
    t.string "metric_1"
    t.string "metric_2"
    t.string "metric_3"
    t.string "metric_4"
    t.float "rate_1"
    t.float "rate_2"
    t.float "rate_3"
    t.float "rate_4"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["slug"], name: "index_products_on_slug", unique: true
  end

  create_table "proof_pictures", force: :cascade do |t|
    t.bigint "review_id", null: false
    t.text "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_proof_pictures_on_review_id"
  end

  create_table "proofs", force: :cascade do |t|
    t.bigint "review_id", null: false
    t.string "code"
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_proofs_on_review_id"
  end

  create_table "reports", force: :cascade do |t|
    t.text "body"
    t.integer "subject", default: 1, null: false
    t.string "reportable_type", null: false
    t.bigint "reportable_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reportable_type", "reportable_id"], name: "index_reports_on_reportable"
    t.index ["reportable_type", "reportable_id"], name: "index_reports_on_reportable_type_and_reportable_id"
  end

  create_table "review_responses", force: :cascade do |t|
    t.integer "rate"
    t.string "metric"
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_review_responses_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "category_id"
    t.bigint "product_id", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reviewable_type"
    t.bigint "reviewable_id"
    t.float "total_rate", default: 0.0
    t.text "rev_comment"
    t.boolean "have_proof", default: false
    t.boolean "verified", default: false
    t.boolean "invited", default: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable"
    t.index ["total_rate"], name: "index_reviews_on_total_rate"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "super_moderator", default: false
    t.boolean "moderator", default: false
  end

  add_foreign_key "metrics", "categories"
  add_foreign_key "photo_proofs", "reviews"
  add_foreign_key "products", "brands"
  add_foreign_key "proof_pictures", "reviews"
  add_foreign_key "proofs", "reviews"
  add_foreign_key "review_responses", "reviews"
  add_foreign_key "reviews", "products"
end
