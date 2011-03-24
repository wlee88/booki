class AddMetaToBookmarks < ActiveRecord::Migration
  def self.up
    add_column :bookmarks, :meta_title, :string
    add_column :bookmarks, :meta_desc, :string
  end

  def self.down
    remove_column :bookmarks, :meta_title
    remove_column :bookmarks, :meta_desc
  end
end
