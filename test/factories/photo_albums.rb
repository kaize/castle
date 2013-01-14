# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo_album do
    name
    description

    trait :with_photo do
      after(:create) do |album|
        create 'photo_album/photo', :photo_album => album
      end
    end
  end
end
