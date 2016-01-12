FactoryGirl.define do
  factory :task do
    name { Faker::Name.title }
    text { Faker::Lorem.sentence(100) }
  end
end
