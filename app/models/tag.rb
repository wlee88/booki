class Tag < ActiveRecord::Base
  #Add class methods from SearchMixin.
  require 'SearchMixin.rb'
  include SearchMixin
  
  belongs_to :bookmark
  
  #before saving tag name, downcase it
  def name=(name)
    write_attribute(:name, name.downcase)
  end
end
