class DeleteEventIdFromEventPhotos < ActiveRecord::Migration
  def change
    remove_column :event_photos, :event_id, :integer
  end
end
