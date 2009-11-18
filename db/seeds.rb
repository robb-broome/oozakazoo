# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
include Ent::Globals

# Owns all the defining objects 
system_catalog = Entity.create({:title => "system catalog", :content => "the group of all system objects", :type => entity_types[:catalog] })

# linked to system catalog: 
people = Entity.create({:title => "people", :content => "the group of all people", :type => entity_types[:catalog_item] })

# users of the system 
users = Entity.create({:title => "all users", :content => "the group of all users", :type => entity_types[:catalog_item] })


Edge.create(:edge_type => edge_types[:contains], :end1 => people.uuid, :end2 => system_catalog.uuid)