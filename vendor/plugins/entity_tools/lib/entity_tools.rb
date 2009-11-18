# EntityTools
module Ent
  module Globals
    def entity_types
      {
        :user => "9bcc4de1-86b1-425d-85c4-9f921f72f0fc",
        :link => "49f3f9fb-7109-425e-a9e0-3427d7313dcb",
        :document => "e5c52cea-861f-4451-b1a6-072923bedce9",
        # This is the object type for objects that define types, or are class definitions.
        :catalog_item => "62653b25-f78e-485d-a1c3-a0d52cd8f3f4",
        # A catalog is a list of items related in some way.
        :catalog => "a9750bc0-1ac5-4055-bfe4-89c03d1a5f93"
      }
    end
  end
end