class Entity < ActiveRecord::Base
  set_primary_key "uuid"
  include UUIDHelper # before save trigger populates the primary key
  # TODO: Named scope for stuff like system objects
  #  http://ryandaigle.com/articles/2008/3/24/what-s-new-in-edge-rails-has-finder-functionality
  # TODO: entity_types not visible here - ? 
  named_scope :system_catalog, :conditions => {:entity_type_uuid => "e6bb5d52-1eb4-4055-b968-ec1b007db058"}
  
  validates_presence_of [:title, :description\]
  
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
  
  def link_to_entity( to, link_type)
    # TODO: link_type => contains default
    # or smart defaults - if this is a catalog, then linktype is 'belongs' 
    to_link_uuid = to.class == "Entity" ? to.uuid : to 
    Edge.create!(:edge_type => link_type, :end1 => self.uuid, :end2 => to_link_uuid)
  end
  
end
