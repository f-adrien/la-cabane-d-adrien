class Option < ApplicationRecord
  include PgSearch::Model
  validates :name, presence: true, uniqueness: true

  pg_search_scope :search_by_name,
                  against: %i[name],
                  ignoring: :accents,
                  using: {
                    tsearch: { prefix: true }
                  }
end
