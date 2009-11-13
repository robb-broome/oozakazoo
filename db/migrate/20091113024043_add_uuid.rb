class AddUuid < ActiveRecord::Migration
  def self.up
    add_column :entities, :uuid, :string, :limit => 36
  end
  

  def self.down
    remove_column :entities, :uuid
  end
end
