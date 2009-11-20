class Edge < ActiveRecord::Base
  set_primary_key "uuid"
  include UUIDHelper # before save trigger populates the primary key

  # TODO: define, or have in system catalog? 
  def self.types
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
      :grants_grant =>  "98d0fc99-37ae-4e51-997e-04c6d9b74637",
    }
  end

end
