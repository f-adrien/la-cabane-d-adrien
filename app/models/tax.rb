class Tax < ApplicationRecord
  include PgSearch::Model
  validates :name, presence: true, uniqueness: true
  validates :rate, presence: true
  validates :rate, numericality: { greater_than_or_equal_to: 0 }

  pg_search_scope :search_by_name,
                  against: %i[name],
                  ignoring: :accents,
                  using: {
                    tsearch: { prefix: true }
                  }
end