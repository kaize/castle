# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :study_request do
    parent_full_name { generate :string }
    children_full_name { generate :string }
    birth_date "2013-01-16"
    school { generate :string }
    address { generate :string }
    phone { generate :string }
    note { generate :string }
    email
    union
  end
end
