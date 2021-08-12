class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :unit

  scope :with_units, -> { includes(:unit) }
  scope :with_user, -> (userid) { where("user_id=?", userid ) }
  
  default_scope { order(created_at: :desc) }
  
  validates :value, presence: true
end
