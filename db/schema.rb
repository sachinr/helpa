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

ActiveRecord::Schema.define(:version => 20111117133923) do

  create_table "attendees", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "mission"
    t.string   "address1"
    t.string   "address2"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "organizations", ["email"], :name => "index_organizations_on_email", :unique => true
  add_index "organizations", ["reset_password_token"], :name => "index_organizations_on_reset_password_token", :unique => true

  create_table "profile_answers", :force => true do |t|
    t.integer  "profile_question_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answerable_id"
    t.string   "answerable_type"
  end

  create_table "profile_questions", :force => true do |t|
    t.string   "long_display"
    t.string   "short_display"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_user_scores", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "equipment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "suggested_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "region"
    t.boolean  "admin"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
