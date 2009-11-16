module UUIDHelper
  # This module
  # assists with using UUIDs for item references in all the other items. 
  # Some thoughts: 
  # At this point, not sure that the TYPE entries should be in the entity table also
  # but it makes nice symmetry, since this would have the same tracking and versioning.
  
  # Global item types
  # TODO: how to look these up in a catalog?  
  USER_TYPE = "9bcc4de1-86b1-425d-85c4-9f921f72f0fc"
  LINK_TYPE = "49f3f9fb-7109-425e-a9e0-3427d7313dcb"
  DOC_TYPE = "e5c52cea-861f-4451-b1a6-072923bedce9"
  # This is the object type for objects that define types, or are class definitions. 
  CATALOG_ITEM_TYPE = "62653b25-f78e-485d-a1c3-a0d52cd8f3f4"
  # A catalog is a list of items related in some way. 
  CATALOG_TYPE = "a9750bc0-1ac5-4055-bfe4-89c03d1a5f93"
  
  def before_create()
    self.uuid = UUID.create_random.to_s
  end
end