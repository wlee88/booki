require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context "valdations and structure" do
    
  should ensure_length_of(:name).is_at_least(3)
  should validate_presence_of(:name)
  should validate_presence_of(:url)
  should have_readonly_attribute(:tinyurl)
  
  should belong_to(:site)
  should have_many(:tags)
  
  should have_db_column :name
  should have_db_column :url
  should have_db_column :tinyurl
  should have_db_column :meta_title
  should have_db_column :meta_desc

  end
end
