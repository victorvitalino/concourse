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

ActiveRecord::Schema.define(version: 20150701010618) do

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "candidates", ["city_id"], name: "index_candidates_on_city_id"
  add_index "candidates", ["email"], name: "index_candidates_on_email", unique: true
  add_index "candidates", ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
  add_index "candidates", ["state_id"], name: "index_candidates_on_state_id"

  create_table "enrollments", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.text     "description"
    t.date     "start"
    t.date     "end"
    t.boolean  "status"
    t.string   "code"
    t.boolean  "fee"
    t.boolean  "fee_value"
    t.text     "content_mail"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "enrollments", ["project_id"], name: "index_enrollments_on_project_id"

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
    t.integer  "order"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "navs", ["page_id"], name: "index_navs_on_page_id"
  add_index "navs", ["project_id"], name: "index_navs_on_project_id"

  create_table "pages", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
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
    t.string   "description"
    t.string   "logo"
    t.string   "header"
    t.string   "footer"
    t.date     "start"
    t.date     "end"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "status_enrollments", force: :cascade do |t|
    t.integer  "enrollment_id"
    t.integer  "candidate_id"
    t.integer  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "status_enrollments", ["candidate_id"], name: "index_status_enrollments_on_candidate_id"
  add_index "status_enrollments", ["enrollment_id"], name: "index_status_enrollments_on_enrollment_id"

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
