class AddTinyurlToBookmarks < ActiveRecord::Migration
  def self.up
    add_column :bookmarks, :tinyurl, :string
  end

  def self.down
    remove_column :bookmarks, :tinyurl
  end
end
