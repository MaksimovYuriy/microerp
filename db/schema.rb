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

ActiveRecord::Schema[7.1].define(version: 2025_07_27_101321) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "telegram"
    t.integer "bonuses", default: 0
    t.string "description"
    t.datetime "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "service_id", null: false
    t.datetime "date"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_notes_on_client_id"
    t.index ["service_id"], name: "index_notes_on_service_id"
    t.index ["state"], name: "index_notes_on_state"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "username"
    t.string "encrypted_password"
    t.string "password_salt"
    t.integer "role"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "notes", "clients"
  add_foreign_key "notes", "services"
end
