class CreateEntities < ActiveRecord::Migration
  def self.up
    create_table :entities, :id => false, :primary_key => :uuid do |t|
      t.string :uuid, :limit => 36
      t.string :title
      t.text :content
      t.timestamps
    end
    add_index :entities, :uuid, :unique => true
  end

  def self.down
    #remove_index :entities, :column => :uuid
    drop_table :entities
  end
end
