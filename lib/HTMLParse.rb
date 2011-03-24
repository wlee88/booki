class HTMLParse

      require 'hpricot'
      require 'open-uri'
    #required to open HTML and hpricot in order to parse the HTML
    
      def initialize(url)
            begin
              @result = open(url)
              @doc = Hpricot(@result)
              @result.close
            rescue
              @doc = nil
            end        
          end
        
      def title
        unless @doc.nil?
          @title = @doc.at("title").inner_html
          return @title unless @title.nil?
        end
        return ""
      end
    
      def desc
        unless @doc.nil?
          @desc = @doc.search("//meta[@name='description']").first
          return @desc["content"] unless @desc.nil?
        end
        return ""
      end

end