# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name
    union

    after(:create) do |r|
      create 'group/schedule', group: r
    end
  end
end
