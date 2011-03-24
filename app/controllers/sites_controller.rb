class SitesController < ApplicationController
  def index
    @sites = Site.all
  end
  
  def show
     @site = Site.find(params[:id])
  end
  
  def destroy
    @bookmark = Site.find(params[:id])
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to(sites_path) }
      format.xml  { head :ok }
    end
  end
end
