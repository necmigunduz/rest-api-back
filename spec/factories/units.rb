# spec/factories/units.rb
FactoryBot.define do
  factory :unit do
    title { Faker::Lorem.word }
  end
end
