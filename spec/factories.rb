FactoryBot.define do
  factory :member  do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
