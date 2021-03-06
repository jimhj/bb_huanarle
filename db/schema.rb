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

ActiveRecord::Schema.define(:version => 20130106134748) do

  create_table "consumptions", :force => true do |t|
    t.string   "tags"
    t.string   "desc"
    t.string   "date"
    t.decimal  "cost",       :precision => 10, :scale => 2, :default => 0.0
    t.integer  "total_id"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "totals", :force => true do |t|
    t.string   "remarks"
    t.integer  "consumptions_count",                                :default => 0
    t.decimal  "total_cost",         :precision => 10, :scale => 2, :default => 0.0
    t.string   "date"
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
  end

end
