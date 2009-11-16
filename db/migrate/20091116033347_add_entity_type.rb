class AddEntityType < ActiveRecord::Migration
  def self.up
    add_column :entities, :entity_type_uuid, :string, :limit => 36
    add_index :entities, :entity_type_uuid
  end
  

  def self.down
    remove_index :entities, :entity_type_uuid
    remove_column :entities, :entity_type_uuid
  end
end
