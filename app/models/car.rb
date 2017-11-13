class Car < ApplicationRecord
  belongs_to :user
  has_many :rentals
  mount_uploader :photo, PhotoUploader
end
