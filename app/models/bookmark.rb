class Bookmark < ActiveRecord::Base
#Add class methods from SearchMixin.

require 'SearchMixin.rb'
include SearchMixin
require 'Tools'
require 'HTMLParse'

  validates_presence_of :name
  validates_presence_of :url
  validates_length_of :name, :minimum => 3
  validates_length_of :url, :minimum => 3
  validates_format_of :url, :with => URI::regexp(%w(http https))
  
  before_save :tinyfyurl, :store_metadata
  attr_readonly :tinyurl
  
  belongs_to :site
  has_many :tags, :dependent => :destroy
  
  #lets model know that I want to control tags from form
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
      :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
      
  #artificial attributes that must be created before save.
  def tinyfyurl
    self.tinyurl = Tools.tinyfy(url)
  end

  #from URL obtain metatag data, and store.
  def store_metadata
    html = HTMLParse.new(url)
    self.meta_title = html.title
    self.meta_desc = html.desc
  end
  
end
