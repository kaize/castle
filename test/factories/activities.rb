# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    name
      
    after(:create) do |r|
      create 'activity/page_activity', activity: r
    end
  end
end
