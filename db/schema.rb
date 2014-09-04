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

ActiveRecord::Schema.define(version: 20140904213205) do

  create_table "data", force: true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forecast_id"
  end

  add_index "data", ["project_id"], name: "index_data_on_project_id", using: :btree

  create_table "forecasts", force: true do |t|
    t.integer  "year"
    t.integer  "revenue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "data_id"
    t.integer  "project_id"
  end

  add_index "forecasts", ["data_id"], name: "index_forecasts_on_data_id", using: :btree
  add_index "forecasts", ["project_id"], name: "index_forecasts_on_project_id", using: :btree

  create_table "futures", force: true do |t|
    t.integer  "future_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_forecasts", force: true do |t|
    t.integer  "forecast_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_forecasts", ["project_id", "forecast_id"], name: "index_project_forecasts_on_project_id_and_forecast_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name",        limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forecast_id"
    t.integer  "user_id"
    t.integer  "data_id"
  end

  add_index "projects", ["data_id"], name: "index_projects_on_data_id", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 50
    t.string   "password",        limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "username",        limit: 25
    t.integer  "project_id"
  end

end
