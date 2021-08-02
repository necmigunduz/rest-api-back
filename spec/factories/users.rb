# spec/factories/users.rb
FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      password '12345'
    end
end