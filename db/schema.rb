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

ActiveRecord::Schema.define(:version => 20120819000108) do

  create_table "bubble_areas", :force => true do |t|
    t.string   "code"
    t.string   "upcode"
    t.string   "name"
    t.string   "theme_code"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "row_order"
    t.text     "i18n_columns"
  end

  create_table "bubble_entries", :force => true do |t|
    t.string   "title"
    t.string   "poster"
    t.text     "content"
    t.text     "props"
    t.datetime "released_at"
    t.integer  "stack_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "expired_at"
    t.string   "type"
    t.string   "extra1"
    t.string   "extra2"
    t.string   "extra3"
    t.string   "code"
    t.text     "i18n_columns"
    t.string   "status"
    t.text     "alert"
  end

  add_index "bubble_entries", ["type"], :name => "idx_entries_type"

  create_table "bubble_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "code"
  end

  create_table "bubble_pages", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "slug"
    t.integer  "area_id"
    t.string   "template"
    t.integer  "row_order"
    t.text     "i18n_columns"
    t.string   "ancestry"
  end

  add_index "bubble_pages", ["ancestry"], :name => "index_bubble_pages_on_ancestry"

  create_table "bubble_permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "stack_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bubble_roles", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bubble_roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "bubble_stacks", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "entry_clazz"
    t.integer  "group_id"
    t.text     "i18n_columns"
  end

  create_table "bubble_users", :force => true do |t|
    t.string   "login",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "role"
    t.boolean  "is_superadmin",          :default => false
  end

  add_index "bubble_users", ["login"], :name => "index_bubble_users_on_login", :unique => true
  add_index "bubble_users", ["reset_password_token"], :name => "index_bubble_users_on_reset_password_token", :unique => true

  create_table "bubble_widgets", :force => true do |t|
    t.string   "title"
    t.integer  "height",     :default => 1
    t.integer  "width",      :default => 1
    t.integer  "offset_x",   :default => 1
    t.integer  "offset_y",   :default => 1
    t.string   "position"
    t.integer  "page_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "type"
    t.text     "props"
    t.integer  "stack_id"
    t.integer  "group_id"
    t.text     "content"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

end
