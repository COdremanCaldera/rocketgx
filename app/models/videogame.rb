class Videogame < ApplicationRecord
  belongs_to :user
  validates :title, :rating, :condition, :price, presence: true
  validates :rating, inclusion: 0..5
end
