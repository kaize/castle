# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title
    body
    uri { generate :slug }
  
    trait :published do
      state 'published'
    end
    
    factory :published_page, traits: [:published]
  end  
end
