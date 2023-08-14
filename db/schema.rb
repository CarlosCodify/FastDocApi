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

ActiveRecord::Schema[7.0].define(version: 2023_08_14_193628) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_customers_on_person_id"
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "content"
    t.bigint "document_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "latitude"
    t.string "longitude"
    t.string "description"
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_locations_on_customer_id"
  end

  create_table "motorcyclists", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_motorcyclists_on_person_id"
  end

  create_table "motorocycles", force: :cascade do |t|
    t.string "model"
    t.string "license_plate"
    t.boolean "active"
    t.bigint "motorcyclist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["motorcyclist_id"], name: "index_motorocycles_on_motorcyclist_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.datetime "send_date"
    t.bigint "motorcyclist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["motorcyclist_id"], name: "index_notifications_on_motorcyclist_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "payment_date"
    t.string "payer_type"
    t.bigint "payer_id"
    t.bigint "shipment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_payments_on_shipment_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "lastname"
    t.string "phone"
    t.string "email"
    t.string "identity_document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "shipment_statuses", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.datetime "request_date"
    t.datetime "delivery_date"
    t.bigint "motorcyclist_id"
    t.bigint "document_id", null: false
    t.bigint "sender_customer_id", null: false
    t.bigint "receiver_customer_id", null: false
    t.bigint "shipment_status_id", null: false
    t.bigint "pickup_location_id"
    t.bigint "delivery_location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_location_id"], name: "index_shipments_on_delivery_location_id"
    t.index ["document_id"], name: "index_shipments_on_document_id"
    t.index ["motorcyclist_id"], name: "index_shipments_on_motorcyclist_id"
    t.index ["pickup_location_id"], name: "index_shipments_on_pickup_location_id"
    t.index ["receiver_customer_id"], name: "index_shipments_on_receiver_customer_id"
    t.index ["sender_customer_id"], name: "index_shipments_on_sender_customer_id"
    t.index ["shipment_status_id"], name: "index_shipments_on_shipment_status_id"
  end

  add_foreign_key "customers", "people"
  add_foreign_key "documents", "document_types"
  add_foreign_key "locations", "customers"
  add_foreign_key "motorcyclists", "people"
  add_foreign_key "motorocycles", "motorcyclists"
  add_foreign_key "notifications", "motorcyclists"
  add_foreign_key "payments", "shipments"
  add_foreign_key "shipments", "customers", column: "receiver_customer_id"
  add_foreign_key "shipments", "customers", column: "sender_customer_id"
  add_foreign_key "shipments", "documents"
  add_foreign_key "shipments", "locations", column: "delivery_location_id"
  add_foreign_key "shipments", "locations", column: "pickup_location_id"
  add_foreign_key "shipments", "motorcyclists"
  add_foreign_key "shipments", "shipment_statuses"
end
