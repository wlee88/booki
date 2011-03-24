require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  #testing not required. 
  #The only interaction between sites and the bookmarks controller is to see if the domain exists(find_or_create_by_domain). If so return
  #the corresponding site, else a new site of new domain is created

  should have_db_column :domain
  should have_many :bookmarks
  

end
