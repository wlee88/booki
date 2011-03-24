class AddNameToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :name, :string
  end

  def self.down
    remove_column :tags, :name
  end
end
