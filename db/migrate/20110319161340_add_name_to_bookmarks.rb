class AddNameToBookmarks < ActiveRecord::Migration
  def self.up
    add_column :bookmarks, :name, :string
  end

  def self.down
    remove_column :bookmarks, :name
  end
end
