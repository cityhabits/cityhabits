class AddAlbumIdToEventPhoto < ActiveRecord::Migration
  def change
    add_reference :event_photos, :album, index: true
  end
end
