# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :union_instructor_relation do
    union
    instructor
    leader false
  end
end
