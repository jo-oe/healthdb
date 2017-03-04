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

ActiveRecord::Schema.define(version: 20170304182139) do

  create_table "citizenships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "iso3166",    limit: 3
    t.string   "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["iso3166"], name: "index_citizenships_on_iso3166", unique: true, using: :btree
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["citizenship_id"], name: "index_clients_on_citizenship_id", using: :btree
    t.index ["code"], name: "index_clients_on_code", unique: true, using: :btree
    t.index ["familystatus_id"], name: "index_clients_on_familystatus_id", using: :btree
    t.index ["homeplace_id"], name: "index_clients_on_homeplace_id", using: :btree
    t.index ["legalstatus_id"], name: "index_clients_on_legalstatus_id", using: :btree
    t.index ["referrer_id"], name: "index_clients_on_referrer_id", using: :btree
    t.index ["sex_id"], name: "index_clients_on_sex_id", using: :btree
  end

  create_table "contactreasons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.integer  "client_id"
    t.date     "contactdate"
    t.integer  "counsellor_id"
    t.integer  "contactreason_id"
    t.string   "contactreasonfreetext"
    t.integer  "insurancestatus_id"
    t.integer  "counselledperson_id"
    t.integer  "translatorused_id"
    t.boolean  "has_insuranceproblem"
    t.boolean  "has_paymentproblem"
    t.boolean  "has_housingproblem"
    t.boolean  "has_workproblem"
    t.boolean  "has_psychosocialproblem"
    t.boolean  "has_healthproblem"
    t.integer  "insuranceproblem_id"
    t.integer  "healthproblem_id"
    t.integer  "referral_id"
    t.integer  "referralcaritas_id"
    t.integer  "referraldiakonie_id"
    t.integer  "referralothercounselling_id"
    t.integer  "referralmedical_id"
    t.integer  "referralauthority_id"
    t.integer  "successfulinsurance_id"
    t.integer  "failedinsurance_id"
    t.text     "comment",                     limit: 65535
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["client_id"], name: "index_contacts_on_client_id", using: :btree
    t.index ["contactreason_id"], name: "index_contacts_on_contactreason_id", using: :btree
    t.index ["counselledperson_id"], name: "index_contacts_on_counselledperson_id", using: :btree
    t.index ["counsellor_id"], name: "index_contacts_on_counsellor_id", using: :btree
    t.index ["failedinsurance_id"], name: "index_contacts_on_failedinsurance_id", using: :btree
    t.index ["healthproblem_id"], name: "index_contacts_on_healthproblem_id", using: :btree
    t.index ["insuranceproblem_id"], name: "index_contacts_on_insuranceproblem_id", using: :btree
    t.index ["insurancestatus_id"], name: "index_contacts_on_insurancestatus_id", using: :btree
    t.index ["referral_id"], name: "index_contacts_on_referral_id", using: :btree
    t.index ["referralauthority_id"], name: "index_contacts_on_referralauthority_id", using: :btree
    t.index ["referralcaritas_id"], name: "index_contacts_on_referralcaritas_id", using: :btree
    t.index ["referraldiakonie_id"], name: "index_contacts_on_referraldiakonie_id", using: :btree
    t.index ["referralmedical_id"], name: "index_contacts_on_referralmedical_id", using: :btree
    t.index ["referralothercounselling_id"], name: "index_contacts_on_referralothercounselling_id", using: :btree
    t.index ["successfulinsurance_id"], name: "index_contacts_on_successfulinsurance_id", using: :btree
    t.index ["translatorused_id"], name: "index_contacts_on_translatorused_id", using: :btree
  end

  create_table "counselledpersons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "failedinsurances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "familystatuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "healthproblems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "homeplaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "insuranceproblems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "insurancestatuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "legalstatuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "problems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "referralauthorities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "referralcaritas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "referraldiakonies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "referralmedicals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "referralothercounsellings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "referrals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "referrers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "sexes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "successfulinsurances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "translatoruseds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci" do |t|
    t.string   "code",       limit: 1
    t.string   "text"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "signature",       limit: 2
    t.string   "password_digest"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["signature"], name: "index_users_on_signature", unique: true, using: :btree
  end

  add_foreign_key "contacts", "clients"
  add_foreign_key "contacts", "contactreasons"
  add_foreign_key "contacts", "failedinsurances"
  add_foreign_key "contacts", "healthproblems"
  add_foreign_key "contacts", "insuranceproblems"
  add_foreign_key "contacts", "insurancestatuses"
  add_foreign_key "contacts", "referralauthorities"
  add_foreign_key "contacts", "referralcaritas", column: "referralcaritas_id"
  add_foreign_key "contacts", "referraldiakonies", column: "referraldiakonie_id"
  add_foreign_key "contacts", "referralmedicals"
  add_foreign_key "contacts", "referralothercounsellings"
  add_foreign_key "contacts", "referrals"
  add_foreign_key "contacts", "successfulinsurances"
  add_foreign_key "contacts", "translatoruseds"
end
