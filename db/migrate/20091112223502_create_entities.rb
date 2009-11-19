class CreateEntities < ActiveRecord::Migration
  def self.up
    create_table :entities, :id => false, :primary_key => :uuid do |t|
      t.string :uuid, :limit => 36
      t.string :entity_type_uuid, :string, :limit => 36
      t.string :title, :limit => 256
      t.text :content
      t.timestamps
    end
    add_index :entities, :entity_type_uuid
    add_index :entities, :title
    add_index :entities, :uuid, :unique => true
  end

  def self.down
    remove_index :entities, :entity_type_uuid
    remove_index :entities, :title
    remove_index :entities, :uuid, :unique => true 
    drop_table :entities
  end
end
