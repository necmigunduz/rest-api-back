class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :unit

  scope :with_units, -> { includes(:unit).select("units.title") }
  
  default_scope { order(created_at: :desc)}

  validates :value, presence: true
end
