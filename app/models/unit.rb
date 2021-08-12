class Unit < ApplicationRecord
  has_many :measurements

  scope :with_measurements, -> (user_id) { includes(:measurements).where(user_id: user_id) }

  validates :title, presence: true
end
