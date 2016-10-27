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

ActiveRecord::Schema.define(version: 20161027100118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_channels_on_user_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.string   "caption"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_messages_on_channel_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "offers", force: :cascade do |t|
    t.float    "budget"
    t.integer  "nb_wanted_people"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_mock",          default: false
    t.integer  "prefered_sex"
    t.string   "name"
    t.json     "activities"
    t.json     "ritual"
    t.json     "partying"
    t.string   "nature"
    t.string   "situation"
    t.boolean  "blocked",          default: false
    t.string   "never_do"
    t.string   "dream_flatmate"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "places", force: :cascade do |t|
    t.integer  "offer_id"
    t.integer  "nb_bathrooms"
    t.integer  "nb_toilets"
    t.boolean  "internet"
    t.boolean  "dishwasher"
    t.boolean  "ac"
    t.boolean  "parking"
    t.boolean  "tv"
    t.boolean  "playstation"
    t.boolean  "xbox"
    t.boolean  "smoking"
    t.boolean  "animals"
    t.float    "caution_price"
    t.float    "electricity_price"
    t.float    "internet_price"
    t.float    "heating_price"
    t.string   "detail"
    t.string   "title"
    t.integer  "nb_places_availables"
    t.string   "property_type"
    t.integer  "surface"
    t.string   "other_stuff"
    t.float    "monthly_rent_price"
    t.float    "total_price"
    t.boolean  "satellite"
    t.boolean  "wii"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["offer_id"], name: "index_places_on_offer_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "place_id"
    t.integer  "simple"
    t.integer  "double"
    t.integer  "bunk"
    t.integer  "sofa"
    t.float    "surface"
    t.boolean  "is_private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_rooms_on_place_id", using: :btree
  end

  create_table "search_helpers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "offer_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_teams_on_offer_id", using: :btree
    t.index ["user_id"], name: "index_teams_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.integer  "sex"
    t.integer  "orientation"
    t.date     "date_of_birth"
    t.string   "more_about_me"
    t.string   "languages"
    t.boolean  "is_studying"
    t.string   "guilty_pleasure"
    t.string   "best_recipe"
    t.string   "voluntary_work"
    t.string   "favorite_quote"
    t.string   "heroic_thing"
    t.string   "happiest_moment"
    t.string   "world_better_place"
    t.string   "top_music"
    t.string   "top_movies"
    t.string   "top_series"
    t.string   "top_books"
    t.string   "top_games"
    t.string   "hobbies"
    t.string   "nick_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "school"
    t.string   "social_networks"
    t.boolean  "blocked"
    t.string   "nationality"
    t.string   "three_wishes"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "channels", "users"
  add_foreign_key "messages", "channels"
  add_foreign_key "messages", "users"
  add_foreign_key "rooms", "places"
  add_foreign_key "teams", "offers"
  add_foreign_key "teams", "users"
end
