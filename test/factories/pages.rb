# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title
    body
    uri { generate :slug }

    after(:create) do |p|
      p.publish
    end
  end
end
