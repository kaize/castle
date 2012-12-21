# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :union do
    name
    description
    category
    association :leader, factory: :instructor

    after(:create) do |r|
      create "union/photo", union: r
    end
  end
end
