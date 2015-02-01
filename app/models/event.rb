class Event < ActiveRecord::Base
  # has_many :event_photos
  # accepts_nested_attributes_for :event_photos, :allow_destroy => true

  validates :name, presence: true
  validates :description, presence: true


 # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  has_attached_file :avatar, :default_url => "https://upload.wikimedia.org/wikipedia/commons/4/47/Comic_image_missing.png"
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
