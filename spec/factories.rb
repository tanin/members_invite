FactoryBot.define do
  factory :member do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end

  factory :group do
    name { Faker::Name.name }
  end

  factory :invite do
    member
    group
  end
end
