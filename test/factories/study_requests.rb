# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :study_request do
    parent_first_name "MyString"
    parent_last_name "MyString"
    parent_middle_name "MyString"
    children_first_name "MyString"
    children_last_name "MyString"
    children_middle_name "MyString"
    birth_date "2013-01-16"
    school "MyString"
    address "MyString"
    phone "MyString"
    note "MyText"
    email
    union
  end
end
