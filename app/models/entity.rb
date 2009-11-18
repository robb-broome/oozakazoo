
class Entity < ActiveRecord::Base
  set_primary_key "uuid"
  include UUIDHelper
  
  attr_accessor :entity_type
  
end
