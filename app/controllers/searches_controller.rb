class SearchesController < ApplicationController
  def index
    #if a keyword parameter exists
    if (params[:search])
      #using the Search Mixin applied within all models, search this keyword
      @bookmarks = Bookmark.search(params[:search])
      @sites = Site.search(params[:search])
      @tags = Tag.search(params[:search])

    else
      #default search if no search params entered
      no = 5
      order_by = "created_at DESC"
       @bookmarks = Bookmark.limit(no).order(order_by)
        @sites = Site.limit(no).order(order_by)
        @tags = Tag.limit(no).order(order_by)
    end
  end
end
