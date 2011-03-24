class Site < ActiveRecord::Base
  #Add class methods from SearchMixin.
  require 'SearchMixin.rb'
  include SearchMixin
  require 'Tools'
  
  has_many :bookmarks, :dependent => :destroy
  validates_uniqueness_of :domain
  
  #obtain domain from url and store
  def domain=(url)
    write_attribute(:domain,Tools.domainify(url))
  end
  
  
end
