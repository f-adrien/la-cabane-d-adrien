class ProductVariant < ApplicationRecord
  belongs_to :product
  has_one_attached :illustration
end