class ChangeEdgeType < ActiveRecord::Migration
  def self.up
    rename_column :edges, :type, :edge_type
  end

  def self.down
    rename_column :edges, :edge_type, :type
  end
end
