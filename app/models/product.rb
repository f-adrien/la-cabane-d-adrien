class Product < ApplicationRecord
  include PgSearch::Model
  has_many :product_options, dependent: :destroy
  has_many :product_taxes, dependent: :destroy
  has_many :taxes, through: :product_taxes
  has_many :product_variants

  accepts_nested_attributes_for :product_options, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :product_taxes, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, uniqueness: true

  pg_search_scope :search_by_name,
                  against: %i[name],
                  ignoring: :accents,
                  using: {
                    tsearch: { prefix: true }
                  }

  def main_variant
    product_variants.find_by(is_main: true)
  end
end
