class VariantValue < ApplicationRecord
  belongs_to :product_variant
  belongs_to :product_option
  validates :name, presence: true
  validates :name, uniqueness: { scope: :product_option_id }
end
