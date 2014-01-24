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

ActiveRecord::Schema.define(version: 20140123193559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "place"
    t.text     "Description"
    t.float    "attrib_work_environment"
    t.float    "attrib_cd"
    t.float    "attrib_flexibility"
    t.float    "attrib_relation"
    t.float    "attrib_leadership"
    t.float    "attrib_pride"
    t.float    "attrib_opportunities"
    t.float    "attrib_opinion"
    t.float    "attrib_stimulatingjob"
    t.float    "attrib_innovation"
    t.float    "attrib_management"
    t.float    "attrib_compensation"
    t.float    "attrib_workload"
    t.float    "attrib_equality"
    t.float    "attrib_objectives"
    t.float    "attrib_cooperation"
    t.float    "attrib_guidance"
    t.float    "attrib_reward"
    t.float    "attrib_career"
    t.float    "attrib_transparancy"
    t.float    "totalreviews"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.float    "rank"
    t.float    "satisfaction"
    t.integer  "reviews"
    t.float    "attrib_satisfaction"
  end

  create_table "company_profiles", force: true do |t|
    t.integer  "profile_id"
    t.integer  "company_id"
    t.string   "to_date"
    t.string   "from_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "satisfaction"
    t.integer  "work_environment"
    t.integer  "cd"
    t.integer  "flexibility"
    t.integer  "relation"
    t.integer  "leadership"
    t.integer  "pride"
    t.integer  "opportunities"
    t.integer  "opinion"
    t.integer  "stimulatingjob"
    t.integer  "innovation"
    t.integer  "management"
    t.integer  "compensation"
    t.integer  "workload"
    t.integer  "equality"
    t.integer  "objectives"
    t.integer  "cooperation"
    t.integer  "guidance"
    t.integer  "reward"
    t.integer  "career"
    t.integer  "transparancy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_ratings", ["company_id"], name: "index_company_ratings_on_company_id", using: :btree
  add_index "company_ratings", ["user_id"], name: "index_company_ratings_on_user_id", using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "ratings", force: true do |t|
    t.integer  "trust"
    t.integer  "workplace"
    t.integer  "cd"
    t.integer  "flexibility"
    t.integer  "relation"
    t.integer  "leadership"
    t.integer  "pride"
    t.integer  "opportunities"
    t.integer  "opinion"
    t.integer  "stimulatingjob"
    t.integer  "innovation"
    t.integer  "management"
    t.integer  "compensation"
    t.integer  "workload"
    t.integer  "equality"
    t.integer  "onjectives"
    t.integer  "cooperation"
    t.integer  "guidance"
    t.integer  "reward"
    t.integer  "career"
    t.integer  "transparancy"
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_companies", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_views", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "rating_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
