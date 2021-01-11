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

ActiveRecord::Schema.define(version: 2021_01_11_010754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone_number"
    t.integer "rut"
    t.integer "service_price"
    t.integer "paid_out"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "admin_id", null: false
    t.bigint "collaborator_id", null: false
    t.index ["admin_id"], name: "index_clients_on_admin_id"
    t.index ["collaborator_id"], name: "index_clients_on_collaborator_id"
  end

  create_table "collaborators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone_number"
    t.float "percentage_profit"
    t.float "profit_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "admin_id", null: false
    t.index ["admin_id"], name: "index_collaborators_on_admin_id"
  end

  create_table "services", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "collaborator_id", null: false
    t.bigint "client_id", null: false
    t.string "name"
    t.index ["client_id"], name: "index_services_on_client_id"
    t.index ["collaborator_id"], name: "index_services_on_collaborator_id"
  end

  add_foreign_key "clients", "admins"
  add_foreign_key "clients", "collaborators"
  add_foreign_key "collaborators", "admins"
  add_foreign_key "services", "clients"
  add_foreign_key "services", "collaborators"
end
