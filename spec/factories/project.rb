FactoryGirl.define do
  factory :project do

    factory :project_faker do
      name        { Faker::Name.name }
      description { Faker::Lorem.sentence(50) }
    end

    factory :project_for_test do
      name        { 'Project Test' }
      description { 'New Test Project' }
    end
  end
end
