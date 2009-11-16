class CreateEntityLinks < ActiveRecord::Migration
  def self.up
    create_table :edges, :force => true, :id => false do |t|
      t.string :type, :limit => 36
      t.string :end1, :limit => 36
      t.string :end2, :limit => 36 
      
      t.timestamps
    end
    add_index :edges, [:end1, :end2, :type], :name => :edge_idx1, :unique => true
    add_index :edges, [:end2, :end1, :type], :name => :edge_idx2, :unique => true
  end

  def self.down
    remove_index :edges, :name => :edge_idx1 
    remove_index :edges, :name => :edge_idx2
    drop_table :entity_links
  end
end
