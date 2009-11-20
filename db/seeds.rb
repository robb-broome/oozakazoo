# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
include Ent::Globals
# note that we are gonna create the uuids, not use these. 
# however, if we generate these each time, then systems will not be able to speak to each other. Could add a UUID parameter on the create method for entity, that would override UUID. 

# Owns all the defining objects. Always special. 
cat_entry = {:title => "system catalog", :content => "the group of all system objects", :entity_type_uuid => SYSTEM_CATALOG_UUID, :uuid => SYSTEM_CATALOG_UUID}
# puts "cat entry is #{cat_entry}"
system_catalog = Entity.new(cat_entry)
system_catalog.save

# puts "system_catalog is #{system_catalog.inspect}"
# administrator of the system (needed?)
administrator = Entity.create!({:title => "sys", :content => "Grantor of the system catalog", :entity_type_uuid => SYSTEM_OBJECT_UUID })

# this is nice, but where is the use case? maybe just to get stuff related to syscat.
# this could be done by using SYSTEM_OBJECT_UUID as the search criteria. 
system_catalog.contains administrator
administrator.grants system_catalog

# create the type definitions
entcat = {}
Entity.types.each do |k,v|
  title = k.to_s.camelcase
  entcat[k] = Entity.create({:title => title , :content => "Type definition for #{title} objects", :entity_type_uuid => SYSTEM_OBJECT_UUID, :uuid => v})
  system_catalog.contains entcat[k]
  administrator.grants entcat[k]
end

# administrator is especial - it is a person, and a user. 
entcat[:user].contains administrator
entcat[:person].contains administrator

# create the edge type definitions
edgecat = {}
Edge.types.each do |k,v|
  title = k.to_s.camelcase
  edgecat[k] = Entity.create({:title => title , :content => "Edge type definition for #{title} edges", :entity_type_uuid => SYSTEM_OBJECT_UUID, :uuid => v})
  system_catalog.contains edgecat[k]
  entcat[:edge].contains edgecat[k]
  administrator.grants edgecat[k]
end
