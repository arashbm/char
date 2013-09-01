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

ActiveRecord::Schema.define(version: 20130901204101) do

  create_table "activities", force: true do |t|
    t.integer  "acted_id"
    t.string   "acted_type"
    t.string   "action"
    t.integer  "actor_id"
    t.text     "parameters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["acted_id"], name: "index_activities_on_acted_id", using: :btree
  add_index "activities", ["actor_id"], name: "index_activities_on_actor_id", using: :btree

  create_table "assignments", force: true do |t|
    t.integer  "assignee_id"
    t.integer  "blueprint_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["assignee_id"], name: "index_assignments_on_assignee_id", using: :btree
  add_index "assignments", ["blueprint_id"], name: "index_assignments_on_blueprint_id", using: :btree

  create_table "blueprints", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "creator_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discussions", force: true do |t|
    t.integer  "blueprint_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "discussions", ["blueprint_id"], name: "index_discussions_on_blueprint_id", using: :btree
  add_index "discussions", ["user_id"], name: "index_discussions_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "on_blog"
  end

  create_table "reviews", force: true do |t|
    t.text     "form"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["post_id"], name: "index_reviews_on_post_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "work_items", force: true do |t|
    t.string   "title"
    t.string   "status"
    t.datetime "due_date"
    t.integer  "workable_id"
    t.string   "workable_type"
    t.integer  "assignee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "work_items", ["assignee_id"], name: "index_work_items_on_assignee_id", using: :btree
  add_index "work_items", ["workable_id"], name: "index_work_items_on_workable_id", using: :btree

end
