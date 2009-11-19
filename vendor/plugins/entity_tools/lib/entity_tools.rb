# EntityTools
module Ent
  module Globals
    # these define the system catalog - may be better to seed these, or create a helper service to provide them. This could be used by the seed script
    def entity_types
      {
        :user => "9bcc4de1-86b1-425d-85c4-9f921f72f0fc",
        # not used - we have edges for this
        :link => "49f3f9fb-7109-425e-a9e0-3427d7313dcb",
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
    # TODO: are link types just generic? How would we find the owner?
    def edge_types
      {
        # owns, allowed to grant access to others
        :grantor => "603f7077-940c-4652-8970-70381a00e223",
        #same both ways (contains / is a member of)
        :contains => "1313e69c-bd26-4054-be05-1b72be7a0b4e",
        # reserved
        :something_else => "5ae17d19-4f65-4353-8482-f166ec81ede9",
        # inheritance
        :defines_attributes => "483d8075-86ee-4f55-b027-58c44154c423",
        # reserved 
        :another_thing => "f66415b0-470c-465c-a003-69a3d9301c7f", 
        # grants view
        :grants_view =>  "7c175d76-3dc4-4756-b5a5-d497a0675771",
        :grants_edit => "a54c8164-989e-4d58-86d0-450254161770", 
        :grants_delete =>  "e7f2cc42-fa61-4b59-9ecf-2bbba4a62ec0", 
        
      }
    end
    # TODO: 
    # how to define permissions on an object I own?
    # are these defined as an element of the link? 
    # public - anyone who can find can see it
    # everyone is a member of people, and view is granted to people. 
    # SEED Data
    # People - group of all people. All 'user' have a link to people
    # Some Group - a special group of people 
    #
  end
end
