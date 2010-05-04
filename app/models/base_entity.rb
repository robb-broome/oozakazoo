class BaseEntity < ActiveRecord::Base
  set_primary_key "uuid"
  include UUIDHelper # before save trigger populates the primary key
  # TODO: Named scope for stuff like system objects
  #  http://ryandaigle.com/articles/2008/3/24/what-s-new-in-edge-rails-has-finder-functionality
  # TODO: entity_types not visible here - ?
  # has_many :inbound_links 
  
  named_scope :system_catalog, :conditions => {:entity_type_uuid => SYSTEM_CATALOG_UUID }
  validates_presence_of [:title, :content]
  
  # version 1.0
  # index :uuid

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
    edge = Edge.create!(:type => Edge.types[:grantor], :end1 => self.uuid, :end2 => uuid )
    puts "created edge #{edge.inspect}"
    return edge
  end

  # create a general link
  def link_to_entity( to, link_type=Edge.types[:contains])
    # TODO: link_type => contains default
    # or smart defaults - if this is a catalog, then linktype is 'belongs'
    to_link_uuid = to.class == "Entity" ? to.uuid : to
    Edge.create!(:edge_type => link_type, :end1 => self.uuid, :end2 => to_link_uuid)
  end

  # create a 'contains' link
  def contains( target)
    Edge.create!(:edge_type => Edge.types[:contains], :end1 => self.uuid, :end2 => target.uuid)
  end

  # create a 'grants' link
  def grants( target)
    # todo: include from elsewhere. gah.
    grants = "98d0fc99-37ae-4e51-997e-04c6d9b74637"
    Edge.create!(:edge_type => Edge.types[:grants_grant], :end1 => self.uuid, :end2 => target.uuid)
  end

  # TODO: Define, or lookup in system catalog?
  def self.types
    {
      :user => "9bcc4de1-86b1-425d-85c4-9f921f72f0fc",
      # not used - we have edges for this
      :edge => "49f3f9fb-7109-425e-a9e0-3427d7313dcb",
      :document => "e5c52cea-861f-4451-b1a6-072923bedce9",
      # This is the object type for objects that define types, or are class definitions.
      :catalog_item => "62653b25-f78e-485d-a1c3-a0d52cd8f3f4",
      # A catalog is a list of items related in some way.
      :catalog => "a9750bc0-1ac5-4055-bfe4-89c03d1a5f93",
      # special objet type - system catalog
      :system_catalog => "e6bb5d52-1eb4-4055-b968-ec1b007db058",
      # defines a time interval
      :interval => "b0e3ce6c-5153-4d59-a2a5-4a21fe638832",
      # defines a permission level
      :permission => "716c7e35-ac46-4a58-b997-69825833b6b3",
      :person => "e4d08df3-2b3c-4c52-b1b4-4d2f1cb08cee",
    }
  end
end
