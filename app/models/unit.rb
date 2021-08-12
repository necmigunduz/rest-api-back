class Unit < ApplicationRecord
  has_many :measurements

  
  # scope :costs_more_than, ->(amount) { where("price > ?", amount) }

  validates :title, presence: true
end
