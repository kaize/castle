# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news do
    title
    body
    published_at { generate :datetime }

    after(:create) do |r|
      create 'news/photo', news: r
      r.publish
    end
  end
end
