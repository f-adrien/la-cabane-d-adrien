class Option < ApplicationRecord
  include PgSearch::Model
  has_many :product_options
  has_many :products, through: :product_options
  
  validates :name, presence: true, uniqueness: true

  pg_search_scope :search_by_name,
                  against: %i[name],
                  ignoring: :accents,
                  using: {
                    tsearch: { prefix: true }
                  }
end
