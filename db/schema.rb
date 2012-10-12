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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121009120144) do

  create_table "answers", :force => true do |t|
    t.integer  "student_id",                  :null => false
    t.integer  "homework_id",                 :null => false
    t.text     "description"
    t.datetime "sent_time",                   :null => false
    t.string   "ip"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "{:null=>false}_file_name"
    t.string   "{:null=>false}_content_type"
    t.integer  "{:null=>false}_file_size"
    t.datetime "{:null=>false}_updated_at"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "course_code",         :null => false
    t.string   "thai_course_name"
    t.string   "english_course_name"
    t.string   "updated_by"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "homeworks", :force => true do |t|
    t.integer  "section_id",  :null => false
    t.string   "title",       :null => false
    t.text     "description"
    t.datetime "start_time",  :null => false
    t.datetime "due_time",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sections", :force => true do |t|
    t.integer  "course_id",  :null => false
    t.string   "year",       :null => false
    t.integer  "semester",   :null => false
    t.integer  "section",    :null => false
    t.boolean  "is_suspend", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "takes", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "section_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teaches", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.string   "alt_email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "position"
    t.datetime "last_login_at"
    t.string   "last_login_ip"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
