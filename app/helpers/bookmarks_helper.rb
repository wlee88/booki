module BookmarksHelper
  def join_tags(bookmarks)
      raw bookmarks.tags.map { |t| (link_to t.name, searches_path(:search => t.name)) }.join(", ")
 end
end
