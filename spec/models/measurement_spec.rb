# spec/models/measurement_spec.rb
require 'rails_helper'

# Test suite for the Measurement model
RSpec.describe Measurement, type: :model do
  # Association test
  # ensure an measurement record belongs to a single unit record
  it { should belong_to(:unit) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:value) }
end