class Product < ApplicationRecord
  has_many :product_options, dependent: :destroy
  has_many :options, through: :product_options

  accepts_nested_attributes_for :product_options, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, uniqueness: true
end
