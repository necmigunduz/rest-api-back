# spec/models/unit_spec.rb
require 'rails_helper'

# Test suite for the Unit model
RSpec.describe Unit, type: :model do
  # Association test
  # ensure Unit model has a 1:m relationship with the Item model
  it { should have_many(:measurements) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
end