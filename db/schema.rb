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

ActiveRecord::Schema.define(version: 20170222162416) do

  create_table "citizenships", force: :cascade do |t|
    t.string   "iso3166",    limit: 3
    t.string   "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["iso3166"], name: "index_citizenships_on_iso3166", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string   "code",             limit: 8
    t.string   "lastname"
    t.string   "firstname"
    t.date     "birthdate"
    t.integer  "sex_id"
    t.integer  "homeplace_id"
    t.integer  "citizenship_id"
    t.integer  "legalstatus_id"
    t.integer  "familystatus_id"
    t.integer  "childrencount"
    t.date     "datefirstcontact"
    t.integer  "referrer_id"
    t.string   "referrerfreetext"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["citizenship_id"], name: "index_clients_on_citizenship_id"
    t.index ["code"], name: "index_clients_on_code", unique: true
    t.index ["familystatus_id"], name: "index_clients_on_familystatus_id"
    t.index ["homeplace_id"], name: "index_clients_on_homeplace_id"
    t.index ["legalstatus_id"], name: "index_clients_on_legalstatus_id"
    t.index ["referrer_id"], name: "index_clients_on_referrer_id"
    t.index ["sex_id"], name: "index_clients_on_sex_id"
  end

  create_table "familystatuses", force: :cascade do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "homeplaces", force: :cascade do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "legalstatuses", force: :cascade do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "referrers", force: :cascade do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "sexes", force: :cascade do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
