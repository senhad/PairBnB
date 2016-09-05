class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :images
  mount_uploaders :images, ImageUploader
  searchkick
end

