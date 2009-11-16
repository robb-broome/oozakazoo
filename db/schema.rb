# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091116045728) do

  create_table "edges", :id => false, :force => true do |t|
    t.string   "type",       :limit => 36
    t.string   "end1",       :limit => 36
    t.string   "end2",       :limit => 36
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "edges", ["end1", "end2", "type"], :name => "edge_idx1", :unique => true
  add_index "edges", ["end2", "end1", "type"], :name => "edge_idx2", :unique => true

  create_table "entities", :id => false, :force => true do |t|
    t.string   "uuid",             :limit => 36
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "entity_type_uuid", :limit => 36
  end

  add_index "entities", ["entity_type_uuid"], :name => "index_entities_on_entity_type_uuid"
  add_index "entities", ["uuid"], :name => "index_entities_on_uuid", :unique => true

end
