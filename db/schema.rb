# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_15_083731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.text "description"
    t.text "requirements"
    t.integer "volunteer_count"
    t.integer "total_volunteer"
    t.text "img_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organiser_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_activities_on_category_id"
    t.index ["organiser_id"], name: "index_activities_on_organiser_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
  end

  create_table "organisers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_organisers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_organisers_on_reset_password_token", unique: true
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "volunteer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_participations_on_activity_id"
    t.index ["volunteer_id"], name: "index_participations_on_volunteer_id"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_volunteers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_volunteers_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "organisers"
  add_foreign_key "participations", "activities"
  add_foreign_key "participations", "volunteers"
end
