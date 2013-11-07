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

ActiveRecord::Schema.define(version: 20131107083056) do

  create_table "akadem_groups", force: true do |t|
    t.string   "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group_description"
    t.date     "establ_date"
  end

  create_table "group_participations", force: true do |t|
    t.integer  "student_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "akadem_group_id"
    t.date     "join_date"
    t.date     "leave_date"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "middle_name"
    t.string   "surname"
    t.string   "spiritual_name"
    t.integer  "telephone"
    t.string   "email"
    t.boolean  "gender"
    t.date     "birthday"
    t.string   "emergency_contact"
    t.text     "photo"
    t.boolean  "profile_fullness"
    t.text     "edu_and_work"
  end

  create_table "student_profiles", force: true do |t|
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "questionarie"
    t.boolean  "passport_copy"
    t.boolean  "petition"
    t.boolean  "photos"
    t.string   "folder_in_archive"
    t.boolean  "active_student"
  end

end
