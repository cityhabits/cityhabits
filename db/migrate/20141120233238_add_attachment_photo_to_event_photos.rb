class AddAttachmentPhotoToEventPhotos < ActiveRecord::Migration
  def self.up
    change_table :event_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :event_photos, :photo
  end
end
