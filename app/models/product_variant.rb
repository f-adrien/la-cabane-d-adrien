class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :variant_values, dependent: :destroy
  has_one_attached :illustration
  validates :name, :price, presence: true
  validates :name, uniqueness: { scope: :product_id }
end
