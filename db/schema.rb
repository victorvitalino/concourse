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

ActiveRecord::Schema.define(version: 20150707195739) do

  create_table "candidate_enrollments", force: :cascade do |t|
    t.integer  "enrollment_id"
    t.integer  "candidate_id"
    t.integer  "form_id"
    t.string   "form_type"
    t.integer  "status",        default: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "candidate_enrollments", ["candidate_id"], name: "index_candidate_enrollments_on_candidate_id"
  add_index "candidate_enrollments", ["enrollment_id"], name: "index_candidate_enrollments_on_enrollment_id"
  add_index "candidate_enrollments", ["form_id"], name: "index_candidate_enrollments_on_form_id"
  add_index "candidate_enrollments", ["form_type"], name: "index_candidate_enrollments_on_form_type"

  create_table "candidates", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "cep"
    t.string   "address"
    t.string   "complement"
    t.integer  "sex"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "candidates", ["city_id"], name: "index_candidates_on_city_id"
  add_index "candidates", ["email"], name: "index_candidates_on_email", unique: true
  add_index "candidates", ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
  add_index "candidates", ["state_id"], name: "index_candidates_on_state_id"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.boolean  "capital"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "consults", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.integer  "content_id"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "consults", ["content_id"], name: "index_consults_on_content_id"
  add_index "consults", ["project_id"], name: "index_consults_on_project_id"

  create_table "enrollments", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.text     "description"
    t.date     "start"
    t.date     "end"
    t.boolean  "status"
    t.string   "code"
    t.boolean  "fee"
    t.float    "fee_value"
    t.text     "content_mail"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "enrollments", ["project_id"], name: "index_enrollments_on_project_id"

  create_table "form_marca_enrollments", force: :cascade do |t|
    t.string   "digital_rg"
    t.string   "digital_voter"
    t.string   "digital_check_voter"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "enrollment_id"
    t.integer  "candidate_id"
    t.text     "content"
    t.integer  "message_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "messages", ["candidate_id"], name: "index_messages_on_candidate_id"
  add_index "messages", ["enrollment_id"], name: "index_messages_on_enrollment_id"

  create_table "navs", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.integer  "nav_type"
    t.integer  "page_id"
    t.integer  "target"
    t.boolean  "status"
    t.integer  "order",      default: 0
    t.string   "url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "navs", ["page_id"], name: "index_navs_on_page_id"
  add_index "navs", ["project_id"], name: "index_navs_on_project_id"

  create_table "pages", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pages", ["project_id"], name: "index_pages_on_project_id"

  create_table "participations", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "enrollment_id"
    t.string   "name"
    t.text     "description"
    t.date     "start"
    t.date     "end"
    t.boolean  "status"
    t.string   "code"
    t.text     "content_mail"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "participations", ["enrollment_id"], name: "index_participations_on_enrollment_id"
  add_index "participations", ["project_id"], name: "index_participations_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo"
    t.string   "header"
    t.string   "footer"
    t.date     "start"
    t.date     "end"
    t.boolean  "status"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable"
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type"

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_project_privileges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_project_privileges", ["project_id"], name: "index_user_project_privileges_on_project_id"
  add_index "user_project_privileges", ["user_id"], name: "index_user_project_privileges_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.boolean  "administrator"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "winners", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "enrollment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "winners", ["candidate_id"], name: "index_winners_on_candidate_id"
  add_index "winners", ["enrollment_id"], name: "index_winners_on_enrollment_id"

end
