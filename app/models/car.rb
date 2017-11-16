class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
