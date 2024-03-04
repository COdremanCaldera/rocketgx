class Videogame < ApplicationRecord
  belongs_to :user
  validates :title, :rating, :condition, :price, presence: true
  validates :rating, inclusion: 0..5
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true }
    }
end
