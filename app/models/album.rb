class Album < ActiveRecord::Base
  has_many :event_photos, dependent: :destroy

  accepts_nested_attributes_for :event_photos, :allow_destroy => true
end
