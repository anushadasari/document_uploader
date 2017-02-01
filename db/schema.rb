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

ActiveRecord::Schema.define(version: 20170131143613) do

  create_table "accidents", force: :cascade do |t|
    t.boolean  "active",                                                             default: true
    t.boolean  "insurance",                                                          default: false
    t.integer  "carblock_id",                    limit: 4
    t.integer  "car_id",                         limit: 2
    t.integer  "cargroup_id",                    limit: 2
    t.string   "impact_area",                    limit: 255
    t.integer  "severity",                       limit: 1
    t.string   "notes",                          limit: 255
    t.integer  "service_center_id",              limit: 2
    t.string   "booking_key",                    limit: 10
    t.datetime "starts"
    t.datetime "ends"
    t.string   "insurance_company",              limit: 20
    t.string   "surveyor_name",                  limit: 255
    t.datetime "surveyor_visit_time"
    t.datetime "garage_estimate_time"
    t.datetime "surveyor_approval_time"
    t.datetime "surveyor_approved_invoice_time"
    t.datetime "final_approval_time"
    t.datetime "ends_invoice"
    t.string   "claim_number",                   limit: 30
    t.decimal  "cost_estimate",                              precision: 8, scale: 2
    t.decimal  "labor_cost",                                 precision: 8, scale: 2, default: 0.0
    t.decimal  "consumables_cost",                           precision: 8, scale: 2, default: 0.0
    t.decimal  "additional_cost",                            precision: 8, scale: 2, default: 0.0
    t.decimal  "total_cost",                                 precision: 8, scale: 2, default: 0.0
    t.decimal  "discount",                                   precision: 7, scale: 2, default: 0.0
    t.decimal  "insurance_covered_amount",                   precision: 8, scale: 2, default: 0.0
    t.decimal  "customer_amount",                            precision: 8, scale: 2
    t.decimal  "zoom_cost",                                  precision: 8, scale: 2
    t.integer  "estimated_days",                 limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "auto_flag"
    t.integer  "vetted_by",                      limit: 4
    t.datetime "vetted_at"
    t.integer  "checklist_by",                   limit: 4
    t.integer  "sourcable_id",                   limit: 4
    t.string   "sourcable_type",                 limit: 255
  end

  add_index "accidents", ["active", "car_id"], name: "idx_accidents_active_car_id", using: :btree
  add_index "accidents", ["carblock_id"], name: "index_accidents_on_carblock_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.integer  "booking_id",           limit: 4
    t.decimal  "amount",                           precision: 8, scale: 2, default: 0.0
    t.integer  "transferred_via_id",   limit: 4
    t.string   "transferred_via_type", limit: 255
    t.string   "activity",             limit: 255
    t.string   "notes",                limit: 255
    t.string   "medium",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["booking_id"], name: "index_activities_on_booking_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "actual_issues", force: :cascade do |t|
    t.integer  "smart_response_issue_id",     limit: 4
    t.integer  "smart_response_sub_issue_id", limit: 4
    t.string   "interface_type",              limit: 255
    t.integer  "interface_id",                limit: 4
    t.integer  "scenario",                    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.integer  "visit_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.text     "properties", limit: 65535
    t.datetime "time"
  end

  add_index "ahoy_events", ["time"], name: "index_ahoy_events_on_time", using: :btree
  add_index "ahoy_events", ["user_id"], name: "index_ahoy_events_on_user_id", using: :btree
  add_index "ahoy_events", ["visit_id"], name: "index_ahoy_events_on_visit_id", using: :btree

  create_table "ahoy_messages", force: :cascade do |t|
    t.string   "token",        limit: 255
    t.text     "to",           limit: 65535
    t.integer  "user_id",      limit: 4
    t.string   "user_type",    limit: 255
    t.string   "mailer",       limit: 255
    t.string   "utm_source",   limit: 255
    t.string   "utm_medium",   limit: 255
    t.string   "utm_campaign", limit: 255
    t.datetime "sent_at"
    t.datetime "opened_at"
    t.datetime "clicked_at"
  end

  add_index "ahoy_messages", ["token"], name: "index_ahoy_messages_on_token", using: :btree
  add_index "ahoy_messages", ["user_id", "user_type"], name: "index_ahoy_messages_on_user_id_and_user_type", using: :btree

  create_table "airport_terminals", force: :cascade do |t|
    t.string   "name",            limit: 100
    t.integer  "status",          limit: 1
    t.integer  "city_id",         limit: 3
    t.string   "landmark",        limit: 255
    t.string   "terminal_code",   limit: 10
    t.text     "description",     limit: 65535
    t.string   "map_link",        limit: 255
    t.decimal  "lat",                           precision: 9, scale: 7
    t.decimal  "lng",                           precision: 9, scale: 7
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "transport_fee",   limit: 4
    t.integer  "fleet_wait_time", limit: 4,                             default: 15
  end

  create_table "airport_terminals_locations", force: :cascade do |t|
    t.integer  "location_id",         limit: 4
    t.integer  "airport_terminal_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shuttle_buffer_time", limit: 4, default: 15
    t.integer  "zoomair_fleet",       limit: 4, default: 3
  end

  create_table "alert_metadata", force: :cascade do |t|
    t.string   "action",          limit: 30,                                         null: false
    t.string   "alert_type",      limit: 30
    t.string   "source",          limit: 20,                                         null: false
    t.integer  "owner",           limit: 1
    t.decimal  "severity",                   precision: 2, scale: 1
    t.boolean  "snoozeable",                                         default: false, null: false
    t.boolean  "escalatable",                                        default: true,  null: false
    t.boolean  "auto_resolvable",                                    default: false, null: false
    t.boolean  "active",                                             default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alert_metadata", ["action", "alert_type"], name: "index_alert_metadata_on_action_and_alert_type", unique: true, using: :btree

  create_table "alerts", force: :cascade do |t|
    t.integer  "loggable_id",         limit: 4
    t.string   "loggable_type",       limit: 255
    t.string   "action",              limit: 30
    t.decimal  "severity",                        precision: 2, scale: 1
    t.datetime "resolved_at"
    t.integer  "created_by",          limit: 4
    t.integer  "resolved_by",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resolved_dashboard",  limit: 4
    t.integer  "fleet_involved",      limit: 4
    t.integer  "live_car_booking_id", limit: 4
    t.integer  "status",              limit: 1,                           default: 1
    t.integer  "alert_metadata_id",   limit: 4
    t.string   "aasm_state",          limit: 255
    t.integer  "escalated_role",      limit: 1
    t.datetime "escalation_time"
  end

  add_index "alerts", ["alert_metadata_id"], name: "index_alerts_on_alert_metadata_id", using: :btree
  add_index "alerts", ["created_at"], name: "idx_alerts_created_at", using: :btree
  add_index "alerts", ["loggable_id"], name: "index_alerts_on_loggable_id", using: :btree
  add_index "alerts", ["loggable_type"], name: "index_alerts_on_loggable_type", using: :btree
  add_index "alerts", ["severity"], name: "index_alerts_on_severity", using: :btree

  create_table "announcements", force: :cascade do |t|
    t.string  "note",   limit: 255
    t.boolean "active"
  end

  create_table "area_severities", force: :cascade do |t|
    t.integer  "damage_area_id",     limit: 4,             null: false
    t.integer  "damage_severity_id", limit: 4,             null: false
    t.integer  "status",             limit: 4, default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attractions", force: :cascade do |t|
    t.integer "city_id",         limit: 2
    t.string  "name",            limit: 255
    t.text    "description",     limit: 65535
    t.text    "places",          limit: 65535
    t.text    "best_time",       limit: 65535
    t.string  "lat",             limit: 255
    t.string  "lng",             limit: 255
    t.integer "state",           limit: 1
    t.integer "category",        limit: 1
    t.boolean "outstation"
    t.string  "seo_title",       limit: 255
    t.string  "seo_description", limit: 255
    t.string  "seo_keywords",    limit: 255
    t.string  "seo_h1",          limit: 255
    t.string  "seo_link",        limit: 255
  end

  add_index "attractions", ["city_id"], name: "index_attractions_on_city_id", using: :btree

  create_table "bank_details", force: :cascade do |t|
    t.string   "bin",        limit: 255, null: false
    t.datetime "valid_from"
    t.datetime "valid_till"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "bank_details", ["bin"], name: "index_bank_details_on_bin", using: :btree

  create_table "bank_id_nums", force: :cascade do |t|
    t.integer  "payment_card_family_id", limit: 4
    t.string   "bin",                    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bank_id_nums", ["payment_card_family_id", "bin"], name: "index_bank_id_nums_on_payment_card_family_id_and_bin", using: :btree

  create_table "bank_offers", force: :cascade do |t|
    t.integer  "offer_id",               limit: 4
    t.integer  "payment_card_family_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bankcodes", force: :cascade do |t|
    t.string   "bankName",   limit: 255
    t.string   "issuerCode", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                 default: true
    t.string   "pg",         limit: 30
  end

  add_index "bankcodes", ["active", "pg"], name: "idx_bankcodes_active_pg", using: :btree
  add_index "bankcodes", ["issuerCode"], name: "index_bankcodes_on_issuerCode", using: :btree
  add_index "bankcodes", ["pg"], name: "idx_bankcodes_pg", using: :btree

  create_table "bill_images", force: :cascade do |t|
    t.integer  "generic_image_id", limit: 4
    t.integer  "bill_id",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bills", force: :cascade do |t|
    t.integer  "image_id",         limit: 4
    t.decimal  "amount",                         precision: 8, scale: 2,                 null: false
    t.decimal  "updated_amount",                 precision: 8, scale: 2
    t.integer  "booking_id",       limit: 4,                                             null: false
    t.boolean  "uploaded_by_role",                                       default: false, null: false
    t.integer  "uploader_id",      limit: 4
    t.integer  "status",           limit: 4,                             default: 0,     null: false
    t.text     "notes",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "billable_id",      limit: 4
    t.string   "billable_type",    limit: 255
    t.integer  "car_id",           limit: 4
  end

  add_index "bills", ["booking_id", "status"], name: "idx_fuel_bills_booking_id_status", using: :btree

  create_table "bluetooth_passkeys", force: :cascade do |t|
    t.integer  "requestable_id",   limit: 4
    t.string   "requestable_type", limit: 255
    t.string   "passkeys",         limit: 255
    t.integer  "status",           limit: 4
    t.integer  "car_id",           limit: 4
    t.string   "owner",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bluetooth_passkeys", ["passkeys"], name: "index_bluetooth_passkeys_on_passkeys", using: :btree

  create_table "booking_details", force: :cascade do |t|
    t.integer  "booking_id",            limit: 4
    t.string   "refund_release_method", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "booking_type",          limit: 1
    t.integer  "hd_status",             limit: 1,                            default: 0
    t.boolean  "hd_charge",                                                  default: true
    t.integer  "user_address_id",       limit: 4
    t.string   "user_address_type",     limit: 255,                          default: "UserAddress"
    t.integer  "late_status",           limit: 4,                            default: 0
    t.datetime "est_ret_time"
    t.boolean  "hard_allocation",                                            default: false
    t.decimal  "score",                             precision: 8,  scale: 3
    t.integer  "temp_car_id",           limit: 2
    t.integer  "credits_marked",        limit: 4,                            default: 0
    t.decimal  "distance",                          precision: 10, scale: 2
    t.decimal  "fuel",                              precision: 10, scale: 2
    t.decimal  "clutch_score",                      precision: 10, scale: 2
    t.integer  "distance_variation",    limit: 4,                            default: 0
    t.integer  "original_user_id",      limit: 4
  end

  add_index "booking_details", ["booking_id"], name: "index_booking_details_on_booking_id", unique: true, using: :btree

  create_table "booking_drivers", force: :cascade do |t|
    t.integer  "booking_id",           limit: 4
    t.integer  "trip_type",            limit: 1
    t.integer  "driver_id",            limit: 4
    t.integer  "overspeed_count",      limit: 4,   default: 0
    t.integer  "status",               limit: 1
    t.string   "address_type",         limit: 255
    t.integer  "address_id",           limit: 4
    t.integer  "hd_vendor_id",         limit: 3
    t.string   "vendor_reference_key", limit: 25
    t.datetime "request_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "request_by",           limit: 255
  end

  add_index "booking_drivers", ["address_id", "address_type"], name: "index_booking_drivers_on_address_id_and_address_type", using: :btree
  add_index "booking_drivers", ["booking_id", "trip_type"], name: "index_booking_drivers_on_booking_id_and_trip_type", using: :btree
  add_index "booking_drivers", ["driver_id"], name: "index_booking_drivers_on_driver_id", using: :btree
  add_index "booking_drivers", ["status"], name: "idx_booking_drivers_status", using: :btree
  add_index "booking_drivers", ["vendor_reference_key"], name: "index_booking_drivers_on_vendor_reference_key", using: :btree

  create_table "booking_payments", force: :cascade do |t|
    t.integer  "booking_id", limit: 4
    t.integer  "payment_id", limit: 4
    t.integer  "amount",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "booking_payments", ["booking_id", "payment_id"], name: "index_booking_payments_on_booking_id_and_payment_id", unique: true, using: :btree
  add_index "booking_payments", ["booking_id"], name: "index_booking_payments_on_booking_id", using: :btree
  add_index "booking_payments", ["payment_id", "booking_id"], name: "index_booking_payments_on_payment_id_and_booking_id", unique: true, using: :btree
  add_index "booking_payments", ["payment_id"], name: "index_booking_payments_on_payment_id", using: :btree

  create_table "booking_suggestions", force: :cascade do |t|
    t.integer  "booking_id",           limit: 4
    t.integer  "cargroup_id",          limit: 2
    t.integer  "original_cargroup_id", limit: 2
    t.integer  "location_id",          limit: 2
    t.integer  "original_location_id", limit: 2
    t.datetime "starts"
    t.datetime "ends"
    t.datetime "original_starts"
    t.datetime "original_ends"
    t.integer  "priority",             limit: 1
    t.decimal  "credits",                          precision: 10, default: 0
    t.integer  "accepted",             limit: 1,                  default: 0
    t.float    "distance",             limit: 24
    t.string   "accepted_by",          limit: 255
    t.boolean  "active",                                          default: true
    t.decimal  "refunds",                          precision: 10, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inv_sug_id",           limit: 4
  end

  add_index "booking_suggestions", ["booking_id"], name: "index_booking_suggestions_on_booking_id", using: :btree
  add_index "booking_suggestions", ["inv_sug_id"], name: "index_booking_suggestions_on_inv_sug_id", unique: true, using: :btree

  create_table "booking_transforms", force: :cascade do |t|
    t.integer  "booking_id",      limit: 4
    t.integer  "user_id",         limit: 4
    t.string   "agent",           limit: 255
    t.string   "disposition",     limit: 255
    t.text     "comments",        limit: 65535
    t.integer  "status",          limit: 1
    t.datetime "book_created_at"
    t.integer  "new_booking_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "called_at"
  end

  add_index "booking_transforms", ["booking_id"], name: "idx_booking_transforms_booking_id", using: :btree
  add_index "booking_transforms", ["user_id"], name: "idx_booking_transforms_user_id", using: :btree

  create_table "booking_without_inventories", force: :cascade do |t|
    t.integer  "booking_id",                     limit: 4
    t.datetime "starts"
    t.datetime "ends"
    t.integer  "cargroup_id",                    limit: 2
    t.integer  "location_id",                    limit: 2
    t.integer  "availability_from_inventory",    limit: 2
    t.integer  "availability_without_inventory", limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "booking_zap_listings", force: :cascade do |t|
    t.integer "zap_listing_id", limit: 4
    t.integer "booking_id",     limit: 4
    t.integer "status",         limit: 2, default: 0
  end

  add_index "booking_zap_listings", ["booking_id"], name: "index_booking_zap_listings_on_booking_id", using: :btree
  add_index "booking_zap_listings", ["zap_listing_id"], name: "index_booking_zap_listings_on_zap_listing_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.integer  "car_id",                     limit: 2
    t.integer  "hub_id",                     limit: 2
    t.integer  "user_id",                    limit: 4
    t.integer  "booked_by",                  limit: 4
    t.integer  "cancelled_by",               limit: 4
    t.string   "comment",                    limit: 255
    t.integer  "days",                       limit: 1
    t.integer  "hours",                      limit: 4
    t.decimal  "estimate",                                 precision: 12, scale: 2
    t.decimal  "discount",                                 precision: 8,  scale: 2
    t.decimal  "total",                                    precision: 12, scale: 2
    t.datetime "starts"
    t.datetime "ends"
    t.datetime "cancelled_at"
    t.datetime "returned_at"
    t.string   "ip",                         limit: 255
    t.integer  "status",                     limit: 1,                              default: 0
    t.integer  "cd_status",                  limit: 1,                              default: 0
    t.integer  "zoom_package_id",            limit: 1
    t.string   "jsi",                        limit: 10
    t.string   "user_name",                  limit: 255
    t.string   "user_email",                 limit: 255
    t.string   "user_mobile",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "start_km",                   limit: 10
    t.string   "end_km",                     limit: 10
    t.integer  "normal_days",                limit: 1,                              default: 0
    t.integer  "normal_hours",               limit: 4,                              default: 0
    t.integer  "discounted_days",            limit: 1,                              default: 0
    t.integer  "discounted_hours",           limit: 4,                              default: 0
    t.datetime "actual_starts"
    t.datetime "actual_ends"
    t.datetime "last_starts"
    t.datetime "last_ends"
    t.boolean  "early",                                                             default: false
    t.boolean  "late",                                                              default: false
    t.boolean  "extended",                                                          default: false
    t.boolean  "rescheduled",                                                       default: false
    t.integer  "fuel_starts",                limit: 1
    t.integer  "fuel_ends",                  limit: 1
    t.integer  "daily_fare",                 limit: 2
    t.integer  "hourly_fare",                limit: 2
    t.integer  "hourly_km_limit",            limit: 2
    t.integer  "daily_km_limit",             limit: 2
    t.integer  "excess_kms",                 limit: 2,                              default: 0
    t.text     "notes",                      limit: 65535
    t.integer  "cargroup_id",                limit: 2
    t.integer  "fleet_id_start",             limit: 3
    t.integer  "fleet_id_end",               limit: 3
    t.integer  "individual_start",           limit: 1
    t.integer  "individual_end",             limit: 1
    t.integer  "transport",                  limit: 1
    t.datetime "unblocks"
    t.boolean  "outstation",                                                        default: false
    t.datetime "checkout"
    t.string   "confirmation_key",           limit: 20
    t.integer  "balance",                    limit: 4
    t.text     "ref_initial",                limit: 65535
    t.text     "ref_immediate",              limit: 65535
    t.string   "promo",                      limit: 255
    t.integer  "credit_status",              limit: 4,                              default: 0
    t.integer  "offer_id",                   limit: 4
    t.integer  "app_offer_id",               limit: 4
    t.integer  "pricing_id",                 limit: 4
    t.integer  "corporate_id",               limit: 4
    t.integer  "city_id",                    limit: 2
    t.string   "pricing_mode",               limit: 2
    t.string   "medium",                     limit: 20
    t.boolean  "shortened",                                                         default: false
    t.integer  "total_fare",                 limit: 4
    t.integer  "deposit_status",             limit: 1,                              default: 0
    t.boolean  "carry",                                                             default: false
    t.boolean  "hold",                                                              default: false
    t.boolean  "release_payment",                                                   default: false
    t.boolean  "settled",                                                           default: false
    t.integer  "actual_cargroup_id",         limit: 2
    t.integer  "actual_cargroup_id_count",   limit: 1,                              default: 0
    t.integer  "car_id_count",               limit: 1,                              default: 0
    t.integer  "cargroup_id_count",          limit: 1,                              default: 0
    t.integer  "ends_count",                 limit: 1,                              default: 0
    t.integer  "end_km_count",               limit: 1,                              default: 0
    t.integer  "location_id_count",          limit: 1,                              default: 0
    t.integer  "returned_at_count",          limit: 1,                              default: 0
    t.integer  "starts_count",               limit: 1,                              default: 0
    t.integer  "start_km_count",             limit: 1,                              default: 0
    t.boolean  "defer_deposit"
    t.boolean  "insufficient_deposit",                                              default: false
    t.integer  "fleet_checklist_by",         limit: 4
    t.integer  "start_checklist_by",         limit: 4
    t.integer  "end_checklist_by",           limit: 4
    t.datetime "release_payment_updated_at"
    t.decimal  "recorded_distance",                        precision: 10, scale: 2
    t.boolean  "used_wallet",                                                       default: false
    t.integer  "deal_id",                    limit: 4
    t.string   "job_id",                     limit: 255
    t.string   "device_uid",                 limit: 255
    t.integer  "overspeed_count",            limit: 4,                              default: 0
    t.boolean  "hold_no_show",                                                      default: false
    t.integer  "version_counter",            limit: 4,                              default: 0,     null: false
    t.boolean  "no_security",                                                       default: false
    t.integer  "serving_location_id",        limit: 3
  end

  add_index "bookings", ["cancelled_at"], name: "index_bookings_on_cancelled_at", using: :btree
  add_index "bookings", ["car_id"], name: "index_bookings_on_car_id", using: :btree
  add_index "bookings", ["cargroup_id"], name: "index_bookings_on_cargroup_id", using: :btree
  add_index "bookings", ["confirmation_key"], name: "index_bookings_on_confirmation_key", using: :btree
  add_index "bookings", ["corporate_id"], name: "index_bookings_on_corporate_id", using: :btree
  add_index "bookings", ["created_at"], name: "idx_bookings_created_at", using: :btree
  add_index "bookings", ["deal_id"], name: "index_bookings_on_deal_id", using: :btree
  add_index "bookings", ["ends"], name: "index_bookings_on_ends", using: :btree
  add_index "bookings", ["hub_id"], name: "index_bookings_on_hub_id", using: :btree
  add_index "bookings", ["jsi"], name: "index_bookings_on_jsi", using: :btree
  add_index "bookings", ["medium"], name: "index_bookings_on_medium", using: :btree
  add_index "bookings", ["offer_id"], name: "idx_bookings_offer_id", using: :btree
  add_index "bookings", ["ref_immediate"], name: "index_bookings_on_ref_immediate", length: {"ref_immediate"=>255}, using: :btree
  add_index "bookings", ["ref_initial"], name: "index_bookings_on_ref_initial", length: {"ref_initial"=>255}, using: :btree
  add_index "bookings", ["release_payment"], name: "idx_bookings_release_payment", using: :btree
  add_index "bookings", ["release_payment_updated_at"], name: "idx_bookings_release_payment_updated_at", using: :btree
  add_index "bookings", ["returned_at"], name: "index_bookings_on_returned_at", using: :btree
  add_index "bookings", ["settled"], name: "idx_bookings_settled", using: :btree
  add_index "bookings", ["starts"], name: "index_bookings_on_starts", using: :btree
  add_index "bookings", ["status"], name: "index_bookings_on_status", using: :btree
  add_index "bookings", ["unblocks"], name: "index_bookings_on_unblocks", using: :btree
  add_index "bookings", ["user_email"], name: "index_bookings_on_user_email", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree
  add_index "bookings", ["user_mobile"], name: "index_bookings_on_user_mobile", using: :btree

  create_table "bookings_payables", force: :cascade do |t|
    t.integer "booking_id", limit: 4
    t.integer "payable_id", limit: 4
  end

  add_index "bookings_payables", ["booking_id"], name: "index_bookings_payables_on_booking_id", using: :btree
  add_index "bookings_payables", ["payable_id"], name: "index_bookings_payables_on_payable_id", using: :btree

  create_table "bookings_receivables", force: :cascade do |t|
    t.integer "booking_id",    limit: 4
    t.integer "receivable_id", limit: 4
  end

  add_index "bookings_receivables", ["booking_id"], name: "index_bookings_receivables_on_booking_id", using: :btree
  add_index "bookings_receivables", ["receivable_id"], name: "index_bookings_receivables_on_receivable_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "campaign_type", limit: 255
    t.string   "title",         limit: 255
    t.text     "content",       limit: 65535
    t.text     "users_query",   limit: 4294967295
    t.string   "from_email",    limit: 255
    t.string   "subject",       limit: 255
    t.integer  "frequency",     limit: 4
    t.boolean  "monday",                           default: false
    t.boolean  "tuesday",                          default: false
    t.boolean  "wednesday",                        default: false
    t.boolean  "thursday",                         default: false
    t.boolean  "friday",                           default: false
    t.boolean  "saturday",                         default: false
    t.boolean  "sunday",                           default: false
    t.boolean  "active",                           default: true
    t.datetime "ended_at"
    t.datetime "started_at"
    t.datetime "scheduled_at"
    t.string   "job_id",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sampling",                         default: false
    t.boolean  "disable",                          default: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "category",          limit: 2
    t.string   "name",              limit: 255
    t.string   "content_type",      limit: 255
    t.integer  "size",              limit: 8
    t.datetime "doc_updated_at"
    t.integer  "s3_status",         limit: 2
    t.integer  "reference_number",  limit: 4
    t.datetime "validity_start"
    t.datetime "validity_end"
    t.integer  "uploaded_by",       limit: 3
    t.integer  "documentable_id",   limit: 4
    t.string   "documentable_type", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
