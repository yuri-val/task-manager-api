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

ActiveRecord::Schema[8.0].define(version: 2024_11_19_214432) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "client_contacts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "client_id", null: false
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "position"
    t.text "notes"
    t.string "tax_identification_number"
    t.boolean "main_contact", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_contacts_on_client_id"
  end

  create_table "clients", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "tax_identification_number"
    t.string "email"
    t.integer "rate_cents", default: 0, null: false
    t.string "rate_currency_id", limit: 8, default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", id: { type: :string, limit: 8 }, force: :cascade do |t|
    t.integer "priority"
    t.string "name"
    t.string "symbol"
    t.json "alternate_symbols", default: [], array: true
    t.string "disambiguate_symbol"
    t.string "subunit"
    t.integer "subunit_to_unit"
    t.boolean "symbol_first"
    t.string "iso_code", null: false
    t.string "iso_numeric"
    t.string "format"
    t.string "html_entity"
    t.string "decimal_mark"
    t.string "thousands_separator"
    t.integer "smallest_denomination"
    t.boolean "fetch_rate", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iso_code"], name: "index_currencies_on_iso_code"
    t.index ["iso_numeric"], name: "index_currencies_on_iso_numeric"
    t.index ["priority"], name: "index_currencies_on_priority"
  end

  create_table "exchange_rates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "currency_id", limit: 8, null: false
    t.date "date"
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_exchange_rates_on_currency_id"
  end

  create_table "jwt_denylists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "jti"
    t.datetime "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylists_on_jti"
  end

  create_table "projects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "client_id"
    t.string "name"
    t.text "description"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
  end

  create_table "tasks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "date"
    t.uuid "client_id", null: false
    t.uuid "project_id", null: false
    t.string "name"
    t.text "description"
    t.integer "status"
    t.decimal "estimated_hours"
    t.decimal "spent_hours"
    t.integer "rate_cents", default: 0, null: false
    t.string "rate_currency_id", limit: 8, default: "USD", null: false
    t.uuid "assigned_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_to_id"], name: "index_tasks_on_assigned_to_id"
    t.index ["client_id"], name: "index_tasks_on_client_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "client_contacts", "clients"
  add_foreign_key "exchange_rates", "currencies"
  add_foreign_key "projects", "clients"
  add_foreign_key "tasks", "clients"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "users", column: "assigned_to_id"
end
