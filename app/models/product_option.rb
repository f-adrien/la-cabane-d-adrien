class ProductOption < ApplicationRecord
  belongs_to :product
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :product_id
end