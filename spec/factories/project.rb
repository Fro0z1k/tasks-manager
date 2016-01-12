FactoryGirl.define do
  factory :project do
    name        { Faker::Name.title }
    description { Faker::Lorem.sentence(50) }
  end
end
