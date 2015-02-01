class EventPhotosController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @event_photos = EventPhoto.all
  end

  def new
    @album = Album.find(params[:album_id])
    @event_photo = EventPhoto.new
  end

  def create
    @album = Album.find(params[:album_id])
    photos = params[:event_photo][:photo]
    photos.each do |photo|
      @album.event_photos.create(photo: photo)
    end

    redirect_to album_path(@album)
  end

  private

    def event_photo_params
      params.require(:event_photo).permit(:event_photo, :photo)
    end
end
