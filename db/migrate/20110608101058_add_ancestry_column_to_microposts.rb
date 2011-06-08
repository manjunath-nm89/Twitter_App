class AddAncestryColumnToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :ancestry, :string
    add_index :microposts, :ancestry
  end

  def self.down
    remove index :microposts, :ancestry
    remove_column :microposts, :ancestry
  end
end
