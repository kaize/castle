# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schedule_classroom, class: Group::Schedule::Classroom do
    name
  end
end
