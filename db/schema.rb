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

ActiveRecord::Schema.define(:version => 20130131155357) do

  create_table "emotion_entries", :force => true do |t|
    t.integer  "value"
    t.string   "kind"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "emotion_entries", ["user_id"], :name => "index_emotion_entries_on_user_id"

  create_table "pain_entries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "value"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "duration"
    t.string   "pain_type"
    t.string   "body_part"
    t.string   "side"
    t.date     "date"
    t.string   "occured_at"
  end

  create_table "pains", :force => true do |t|
    t.string   "name"
    t.string   "bodypart"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.text     "description"
  end

  create_table "therapy_entries", :force => true do |t|
    t.string   "intensity"
    t.integer  "duration"
    t.string   "comment"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "occured_at"
    t.date     "date"
    t.integer  "user_id"
    t.string   "therapy_type"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
