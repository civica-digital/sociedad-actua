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

ActiveRecord::Schema.define(version: 20160215113124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collaborators", force: :cascade do |t|
    t.string "name"
    t.string "type_collaborator"
    t.text   "description"
    t.string "email"
    t.string "site_url"
    t.string "facebook_url"
    t.string "instagram_url"
    t.string "twitter_url"
    t.string "youtube_url"
    t.string "blog_url"
    t.string "logo"
    t.string "causes_interest"
    t.string "other_causes"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.text     "notes"
    t.string   "price"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
    t.text     "address"
    t.string   "info"
    t.string   "causes"
    t.float    "lat"
    t.float    "lng"
    t.time     "time"
    t.string   "collaborators"
  end

  create_table "investors", force: :cascade do |t|
    t.string   "name"
    t.string   "type_investor"
    t.string   "site_url"
    t.string   "blog_url"
    t.string   "facebook_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "address"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "telephone"
    t.string   "zipcode"
    t.string   "email"
    t.string   "investment_type"
    t.string   "amount"
    t.boolean  "constitution"
    t.string   "expense_type"
    t.string   "logo"
    t.string   "causes_supported"
    t.string   "twitter_url"
    t.string   "youtube_url"
    t.string   "instagram_url"
    t.string   "contact_name"
    t.string   "legal_time"
    t.string   "other_causes"
    t.boolean  "voluntering"
    t.boolean  "money"
    t.boolean  "specie"
    t.boolean  "service"
    t.string   "organization"
    t.integer  "organization_id"
  end

  add_index "investors", ["organization_id"], name: "index_investors_on_organization_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "type_organization"
    t.string   "name"
    t.datetime "remember_created_at",       default: '2015-10-30 18:05:57', null: false
    t.string   "email"
    t.string   "rfc"
    t.text     "mision"
    t.string   "address"
    t.string   "colonia"
    t.string   "town"
    t.integer  "zip"
    t.string   "telephone"
    t.string   "site"
    t.string   "blog"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "youtube"
    t.string   "instagram"
    t.integer  "foundation",                default: 2015
    t.boolean  "show_address",              default: false
    t.boolean  "show_colonia",              default: false
    t.boolean  "show_town",                 default: false
    t.boolean  "show_telephone",            default: false
    t.boolean  "show_zip",                  default: false
    t.boolean  "show_email"
    t.string   "logo"
    t.string   "causes_interest"
    t.integer  "rate_private",              default: 30
    t.integer  "rate_national",             default: 50
    t.integer  "rate_international",        default: 50
    t.integer  "rate_public",               default: 30
    t.integer  "rate_auto",                 default: 40
    t.string   "profile_url"
    t.string   "other_causes"
    t.string   "supports"
    t.boolean  "has_funding_national"
    t.boolean  "has_funding_international"
    t.float    "lat"
    t.float    "lng"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "goals"
    t.text     "description"
    t.string   "status"
    t.text     "direction"
    t.text     "comments_from_direction"
    t.string   "name_of_owner"
    t.text     "email"
    t.string   "phone"
    t.text     "website"
    t.text     "facebook"
    t.text     "twitter"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "organization_id"
    t.string   "photo_project"
    t.float    "lat"
    t.float    "lng"
    t.string   "causes_interest"
    t.string   "clasification"
    t.string   "other_causes"
    t.string   "town"
    t.string   "collaborators"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "profile_id"
    t.string   "profile_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name", "resource_type", "resource_id"], name: "index_users_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["profile_type", "profile_id"], name: "index_users_on_profile_type_and_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "users_users", id: false, force: :cascade do |t|
    t.integer "user_id"
  end

  add_index "users_users", ["user_id", "user_id"], name: "index_users_users_on_user_id_and_user_id", using: :btree

  add_foreign_key "investors", "organizations"
end
