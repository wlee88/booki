require 'test_helper'

class TagTest < ActiveSupport::TestCase

  context "validates and structure" do
  should belong_to(:bookmark)
  should have_db_column :name
  should have_db_column :bookmark_id

  end
end

