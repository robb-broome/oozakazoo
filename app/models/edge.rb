class Edge < ActiveRecord::Base
  set_primary_key "uuid"
  include UUIDHelper # before save trigger populates the primary key
  
  def link(from, to, link_type)
    from_link = from.class == "Entity" ? from.uuid : from 
    to_link = to.class == "Entity" ? to.uuid : to 
    Edge.create!(:edge_type => link_type, :end1 => from_link, :end2 => to_link)
  end 
    
end 
