class BookmarksController < ApplicationController

  def index
      @bookmarks = Bookmark.all.paginate(:per_page => 10, :page => params[:page])
  end
  
  def show
    @bookmark = Bookmark.find(params[:id])
    
     respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @bookmark }
      end
  end
  
  def new
    @bookmark = Bookmark.new
  end
  
  def edit
    @bookmark = Bookmark.find(params[:id])
  end
  
  def create
    @bookmark = Bookmark.new(params[:bookmark])
    @bookmark.site_id = Site.find_or_create_by_domain(params[:bookmark][:url]).id#Check if domain exists in the Site model. Create New if not
     respond_to do |format|
        if @bookmark.save
          format.html { redirect_to(bookmarks_path) }
          format.xml  { render :xml => @bookmark, :status => :created, :location => @post }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
        end
      end
  end
  
  def update
    @bookmark = Bookmark.find(params[:id])      
     respond_to do |format|
        if @bookmark.update_attributes(params[:bookmark])
          format.html { redirect_to(bookmarks_path) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to(bookmarks_path) }
      format.xml  { head :ok }
    end
  end
end
