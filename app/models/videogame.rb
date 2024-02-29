class Videogame < ApplicationRecord
  belongs_to :user
  validates :title, :rating, :condition, :price, presence: true
end
