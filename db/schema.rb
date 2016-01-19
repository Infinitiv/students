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

ActiveRecord::Schema.define(version: 20160118074442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educational_programs", force: :cascade do |t|
    t.string   "name"
    t.string   "level"
    t.string   "standart"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "next_status_id"
    t.integer  "previous_status_id"
    t.integer  "moving_document_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "moves", ["moving_document_id"], name: "index_moves_on_moving_document_id", using: :btree
  add_index "moves", ["student_id"], name: "index_moves_on_student_id", using: :btree

  create_table "moving_documents", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.date     "date"
    t.string   "type"
    t.string   "mime_type"
    t.binary   "data"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moving_documents_students", id: false, force: :cascade do |t|
    t.integer "student_id",         null: false
    t.integer "moving_document_id", null: false
  end

  create_table "personal_documents", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.date     "date"
    t.string   "mime_type"
    t.binary   "data"
    t.binary   "thumbnail"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "personal_documents", ["student_id"], name: "index_personal_documents_on_student_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "sex"
    t.date     "birth_date"
    t.integer  "region_code"
    t.date     "education_start_date"
    t.string   "education_start_place"
    t.string   "benefit_type"
    t.integer  "target_organization_id"
    t.string   "source"
    t.string   "sitizenship"
    t.integer  "educational_program_id"
    t.integer  "stage"
    t.integer  "group"
    t.boolean  "stage_leader",           default: false
    t.boolean  "group_leader",           default: false
    t.integer  "status_id"
    t.text     "comment"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "students", ["educational_program_id"], name: "index_students_on_educational_program_id", using: :btree
  add_index "students", ["status_id"], name: "index_students_on_status_id", using: :btree
  add_index "students", ["target_organization_id"], name: "index_students_on_target_organization_id", using: :btree

  create_table "target_organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",            default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "moves", "moving_documents"
  add_foreign_key "moves", "students"
  add_foreign_key "personal_documents", "students"
  add_foreign_key "students", "educational_programs"
  add_foreign_key "students", "statuses"
  add_foreign_key "students", "target_organizations"
end
