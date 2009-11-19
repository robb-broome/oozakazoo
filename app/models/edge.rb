class Edge < ActiveRecord::Base
  set_primary_key "uuid"
  include UUIDHelper # before save trigger populates the primary key
  include Ent::Globals
end 
