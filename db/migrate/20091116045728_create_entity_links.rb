class CreateEntityLinks < ActiveRecord::Migration
  def self.up
    create_table :edges, :force => true, :id => false, :primary_key => :uuid  do |t|
      t.string :uuid, :limit => 36
      t.string :edge_type, :limit => 36
      t.string :end1, :limit => 36
      t.string :end2, :limit => 36 
      
      t.timestamps
    end
    add_index :edges, :uuid, :unique => true 
    add_index :edges, [:end1, :end2, :edge_type], :name => :edge_idx1, :unique => true
    add_index :edges, [:end2, :end1, :edge_type], :name => :edge_idx2, :unique => true
  end

  def self.down
    remove_index :edges, :uuid, :unique => true 
    remove_index :edges, :name => :edge_idx1 
    remove_index :edges, :name => :edge_idx2
    drop_table :entity_links
  end
end
