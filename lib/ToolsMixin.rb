module ToolsMixin
def self.included(base)
   base.extend ClassMethods
end

  module ClassMethods
    def domainify(url)
      if url.empty?
        return ""
      end
      begin
        uri = URI.parse(url)
        uri.host
        uri.host.gsub("www.","")
      rescue URI::InvalidURIError
        logger.error "Invalid URI Error"
        ""
      end
    end

       #using the tinyurl gem, generate a tinyurl. if the original url is returned, we have a problem 
      def tinyfy(url)
          t = Tinyurl.new(url)
          if t.tiny == "http://www.tinyurl.com/"
            t.url #error
          else
             t.tiny
          end
      end
  end
  
end