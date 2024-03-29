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

ActiveRecord::Schema.define(:version => 20161105022800) do

  create_table "games", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["updated_at"], :name => "index_games_on_updated_at", :order => {"updated_at"=>:desc}
  add_index "games", ["user_id"], :name => "index_games_on_user_id"

  create_table "portals", :force => true do |t|
    t.string "name"
    t.string "short_name"
    t.string "url"
    t.string "pattern"
    t.string "color",      :default => "000000"
  end

  create_table "requests", :force => true do |t|
    t.integer  "game_id"
    t.string   "remote_id"
    t.string   "url"
    t.integer  "portal_id"
    t.datetime "created_at"
  end

  add_index "requests", ["created_at"], :name => "index_requests_on_created_at"
  add_index "requests", ["game_id", "portal_id"], :name => "index_requests_on_game_id_and_portal_id", :unique => true
  add_index "requests", ["game_id"], :name => "index_requests_on_game_id"
  add_index "requests", ["portal_id"], :name => "index_requests_on_portal_id"

  create_table "user_portal_accounts", :force => true do |t|
    t.integer "user_id"
    t.integer "portal_id"
    t.string  "username"
  end

  add_index "user_portal_accounts", ["portal_id"], :name => "index_user_portal_accounts_on_portal_id"
  add_index "user_portal_accounts", ["user_id"], :name => "index_user_portal_accounts_on_user_id"

  create_table "user_votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "request_id"
    t.datetime "created_at"
  end

  add_index "user_votes", ["created_at"], :name => "index_user_votes_on_created_at"
  add_index "user_votes", ["request_id"], :name => "index_user_votes_on_request_id"
  add_index "user_votes", ["user_id", "request_id"], :name => "index_user_votes_on_user_id_and_request_id", :unique => true
  add_index "user_votes", ["user_id"], :name => "index_user_votes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",                                           :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.integer  "points",                          :default => 0
    t.string   "forums"
    t.string   "blogs"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.boolean  "banned",                          :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["points"], :name => "index_users_on_points", :order => {"points"=>:desc}
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["username"], :name => "index_users_on_username"

end
