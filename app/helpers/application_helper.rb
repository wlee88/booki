module ApplicationHelper
    #HTML parsing library
    require 'HTMLParse'
    
    def title(page_title) 
      content_for(:title) {page_title}
    end
    
     def above_container(text)
       content_for(:above_container) {text}
    end
    
    def get_attr_html(title,desc)
      "Title: " + title + "<br />" +
      "Desc: " + desc + "<br />"
    end
    
    def get_title_from_html(url)
       html = HTMLParse.new(url)
       html.title
    end
      
    def get_desc_from_html(url)
      html = HTMLParse.new(url)
       html.desc
    end
    
    def header(caption)
      raw put_as_header(caption)
    end
    
    def put_as_header(text)
       "<p class ='top_text'>" + text + "</p>"
    end
    
    def create_top_button(text)
      above_container(link_to text, new_bookmark_path, :class => "mega_button", :id => "button")
    end
    
    def create_top_bookmarks_button
       above_container(link_to "Bookmarks", bookmarks_path, :class => "mega_button", :id => "button")
    end
    
   
end
