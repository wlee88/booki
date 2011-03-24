module RowsHelper
  def create_bookmark_name_row(bookmark)
      link_to bookmark.name, bookmark, :title => get_attr_html(bookmark.meta_title.to_s,bookmark.meta_desc.to_s), :class => :titles 
   end

   def create_bookmark_tinyurl_row(bookmark)
     link_to bookmark.tinyurl[7..-1], bookmark.tinyurl, :title => "url: " + bookmark.url
   end

   def create_bookmarks_errors_box(bookmark)
      if @bookmark.errors.any? 
       html = "<div id='error_explanation'>"
         html += "<h2>"+ pluralize(@bookmark.errors.count, "error") + "prohibited this post from being saved:</h2>"
         html += "<ul>"
         @bookmark.errors.full_messages.each do |msg|
           html += "<li>" + msg  + "</li>"
       end
         html += "</ul>"
       html += "</div>"
     end
       above_container(raw html)
     end
     
  def make_domain_search_row(site)
      raw link_to site.domain, searches_path(:search => site.id), :title => "View all bookmarks under this domain"
  end
        
  def create_sites_delete_button(site)
      raw link_to "delete", site_path(site), :method => :delete
  end
    
  def create_searches_bookmark_delete_button(bookmark)
      raw link_to "delete", bookmark_path(bookmark), :method => :delete
  end
    
  def create_searches_tag_delete_button(tag)
      raw link_to "delete", site_path(tag), :method => :delete
  end
  
end