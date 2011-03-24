class ApplicationController < ActionController::Base
  require 'Tools'#inherits methods found within Tools class.
  require 'HTMLParse'#inherits methods found within HTML
  protect_from_forgery
  
  helper :all

end
