class ProductOption < ApplicationRecord
  belongs_to :product
  has_many :variant_values, dependent: :destroy
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :product_id
end
