class Car < ApplicationRecord
  include PgSearch
  pg_search_scope :search, against: [ :brand, :model, :year, :color, :price ]
  belongs_to :user

  has_many :rentals, dependent: :destroy

  validates :brand, :model, :year, :color, :price, presence: true

  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end

