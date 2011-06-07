class AddIndexToRelationships < ActiveRecord::Migration
  def self.up
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
  end

  def self.down
    remove_index :relationships, :follower_id
    remove_index :relationships, :followed_id
  end
end
