class CreateEventPhotos < ActiveRecord::Migration
  def change
    create_table :event_photos do |t|
      t.references :event, index: true

      t.timestamps
    end
  end
end
