class Review < ApplicationRecord
  belongs_to :car
  validates :content, length: { minimum: 20 }
end
