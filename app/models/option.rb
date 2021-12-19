class Option < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
