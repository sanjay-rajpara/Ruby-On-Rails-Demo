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

ActiveRecord::Schema.define(version: 20170918104424) do

  create_table "abouts", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.integer "display_order"
    t.text "status"
    t.text "created_at"
    t.text "updated_at"
  end

  create_table "configs", force: :cascade do |t|
    t.text "website_name"
    t.text "email"
    t.binary "phone"
    t.text "website"
    t.text "logo"
    t.text "created_at"
    t.text "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.text "name"
    t.text "email_field"
    t.binary "phone_number"
    t.text "message"
    t.text "created_at"
  end

  create_table "contents", force: :cascade do |t|
    t.text "url_key"
    t.text "title"
    t.text "content"
    t.text "status"
    t.text "created_at"
    t.text "updated_at"
  end

  create_table "pages", force: :cascade do |t|
    t.text "title"
    t.text "pages"
    t.text "url"
    t.integer "display_order"
    t.text "status"
    t.text "created_at"
    t.text "updated_at"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "name"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.text "image"
    t.text "url"
    t.integer "display_order"
    t.text "status"
    t.text "created_at"
    t.text "updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.text "image"
    t.text "name"
    t.text "designation"
    t.text "description"
    t.integer "display_order"
    t.text "status"
    t.text "created_at"
    t.text "updated_at"
  end

  create_table "testimonials", force: :cascade do |t|
    t.text "title"
    t.text "testimonial"
    t.text "client_name"
    t.integer "display_order"
    t.text "status"
    t.text "created_at"
    t.text "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "role"
    t.text "status"
    t.text "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
