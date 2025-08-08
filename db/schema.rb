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

ActiveRecord::Schema[7.1].define(version: 2025_08_08_153626) do
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

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.float "quantity", default: 0.0
    t.float "alert_quantity", default: 0.0
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
    t.bigint "worker_id"
    t.index ["client_id"], name: "index_notes_on_client_id"
    t.index ["service_id"], name: "index_notes_on_service_id"
    t.index ["state"], name: "index_notes_on_state"
    t.index ["worker_id"], name: "index_notes_on_worker_id"
  end

  create_table "performed_services", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "service_id", null: false
    t.bigint "worker_id", null: false
    t.boolean "bonuses", default: false
    t.integer "total_price"
    t.integer "payment_method"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_performed_services_on_client_id"
    t.index ["service_id"], name: "index_performed_services_on_service_id"
    t.index ["worker_id"], name: "index_performed_services_on_worker_id"
  end

  create_table "service_material_logs", force: :cascade do |t|
    t.bigint "service_material_id", null: false
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_material_id"], name: "index_service_material_logs_on_service_material_id"
  end

  create_table "service_materials", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "material_id", null: false
    t.float "required_quantity", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_service_materials_on_material_id"
    t.index ["service_id"], name: "index_service_materials_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "token"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "username"
    t.integer "role"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "notes", "clients"
  add_foreign_key "notes", "services"
  add_foreign_key "notes", "workers"
  add_foreign_key "performed_services", "clients"
  add_foreign_key "performed_services", "services"
  add_foreign_key "performed_services", "workers"
  add_foreign_key "service_material_logs", "service_materials"
  add_foreign_key "service_materials", "materials"
  add_foreign_key "service_materials", "services"
end
