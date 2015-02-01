class AlbumsController < ApplicationController
  def index
    @albums = Album.includes(:event_photos).order("created_at DESC")
  end

  def show
    @event_photos = Album.find(params[:id]).event_photos
  end
end
