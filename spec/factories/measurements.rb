# spec/factories/measurements.rb
FactoryBot.define do
    factory :measurement do
      value { Faker::Number.decimal_part(digits: 2) }
    end
  end