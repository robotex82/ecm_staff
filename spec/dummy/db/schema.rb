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

ActiveRecord::Schema.define(:version => 20140426084922) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "ecm_pictures_attached_pictures", :force => true do |t|
    t.integer  "ecm_pictures_picture_id"
    t.integer  "pictureable_id"
    t.string   "pictureable_type"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "ecm_pictures_picture_galleries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "link_images"
    t.integer  "pictures_count",  :default => 0, :null => false
    t.integer  "position"
    t.string   "markup_language"
    t.string   "slug"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "ecm_pictures_pictures", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "picture_gallery_id"
    t.integer  "position"
    t.string   "markup_language"
    t.string   "slug"
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.string   "image_content_type"
    t.datetime "image_updated_at"
    t.string   "image_fingerprint"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "ecm_staff_business_unit_translations", :force => true do |t|
    t.integer  "business_unit_id"
    t.string   "locale",           :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "description"
    t.string   "slug"
    t.string   "name"
  end

  add_index "ecm_staff_business_unit_translations", ["business_unit_id"], :name => "index_cc00704703780d8b9055f73177cca693f3a1d0ed"
  add_index "ecm_staff_business_unit_translations", ["locale"], :name => "index_ecm_staff_business_unit_translations_on_locale"

  create_table "ecm_staff_business_units", :force => true do |t|
    t.integer  "organisation_id"
    t.string   "name"
    t.text     "description"
    t.string   "markup_language"
    t.string   "slug"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "ecm_staff_business_units", ["organisation_id"], :name => "index_ecm_staff_business_units_on_organisation_id"
  add_index "ecm_staff_business_units", ["parent_id"], :name => "index_ecm_staff_business_units_on_parent_id"

  create_table "ecm_staff_organisation_translations", :force => true do |t|
    t.integer  "organisation_id"
    t.string   "locale",          :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.text     "description"
    t.string   "slug"
    t.string   "name"
  end

  add_index "ecm_staff_organisation_translations", ["locale"], :name => "index_ecm_staff_organisation_translations_on_locale"
  add_index "ecm_staff_organisation_translations", ["organisation_id"], :name => "index_ec7eecd88462db07cbe6bb6d0465dff84bb8b9db"

  create_table "ecm_staff_organisations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "markup_language"
    t.string   "slug"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "ecm_staff_people", :force => true do |t|
    t.string   "prefix"
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthdate"
    t.text     "description"
    t.integer  "position"
    t.string   "markup_language"
    t.string   "slug"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "ecm_staff_person_positions", :force => true do |t|
    t.integer  "person_id"
    t.integer  "business_unit_id"
    t.integer  "position_id"
    t.date     "begin_at"
    t.date     "end_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "ecm_staff_person_positions", ["business_unit_id"], :name => "index_ecm_staff_person_positions_on_business_unit_id"
  add_index "ecm_staff_person_positions", ["person_id"], :name => "index_ecm_staff_person_positions_on_person_id"
  add_index "ecm_staff_person_positions", ["position_id"], :name => "index_ecm_staff_person_positions_on_position_id"

  create_table "ecm_staff_person_translations", :force => true do |t|
    t.integer  "person_id"
    t.string   "locale",      :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.string   "prefix"
    t.string   "slug"
  end

  add_index "ecm_staff_person_translations", ["locale"], :name => "index_ecm_staff_person_translations_on_locale"
  add_index "ecm_staff_person_translations", ["person_id"], :name => "index_ecm_staff_person_translations_on_ecm_staff_person_id"

  create_table "ecm_staff_position_translations", :force => true do |t|
    t.integer  "position_id"
    t.string   "locale",      :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.string   "slug"
    t.string   "name"
  end

  add_index "ecm_staff_position_translations", ["locale"], :name => "index_ecm_staff_position_translations_on_locale"
  add_index "ecm_staff_position_translations", ["position_id"], :name => "index_ecm_staff_position_translations_on_ecm_staff_position_id"

  create_table "ecm_staff_positions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "markup_language"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "slug"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "ecm_staff_positions", ["parent_id"], :name => "index_ecm_staff_positions_on_parent_id"

end
