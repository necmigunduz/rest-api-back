class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :unit

  scope :with_units, lambda {
    joins(:unit)
      .select('units.title', 'value', 'created_at')
  }

  scope :with_user, ->(userid) { where('user_id=?', userid) }

  validates :value, presence: true
end
