FactoryGirl.define do
  factory :task do

    factory :task_faker do
      name { Faker::Name.title }
      text { Faker::Lorem.sentence(100) }
    end

    factory :task_for_test do
      name { 'Task Test' }
      text { 'New Test Task' }
    end
  end
end
