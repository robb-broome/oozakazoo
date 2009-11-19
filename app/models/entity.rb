class Entity < ActiveRecord::Base
  set_primary_key "uuid"
  include UUIDHelper # before save trigger populates the primary key
  include Ent::Globals
  # TODO: Named scope for stuff like system objects
  # http://ryandaigle.com/articles/2008/3/24/what-s-new-in-edge-rails-has-finder-functionality
  named_scope :system_catalog, :conditions => {:entity_type_uuid => entity_types[:system_catalog]}
  
  def related_entities
    edges = Edge.find(:all, :conditions => ["end1 = :uuid OR end2 = :uuid", {:uuid => self.uuid} ] ).collect {|edge| edge.end1 == self.uuid ? edge.end2 : edge.end1 }.uniq
    puts "Edges are #{edges.inspect}"
    Entity.find edges
  end 
  
  def owner_uuid
    nil 
  end 
  
  def owner_uuid=(to_uuid)
    puts "linking to uuid #{to_uuid}"
    to_entity = Entity.find(to_uuid)
    puts "linking to entity #{to_entity.inspect}"
    edge = Edge.create!(:type => edge_types[:grantor], :end1 => self.uuid, :end2 => uuid )
    puts "created edge #{edge.inspect}"
    return edge
  end 
  
end
