
class Entity < ActiveRecord::Base
  set_primary_key "uuid"
  include UUIDHelper
  
end
