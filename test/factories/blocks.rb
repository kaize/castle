# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :block do
    order_at{ generate :integer }
    on_main true
    title
    body
  end

  factory :published_block, parent: :block do
    state_event 'publish'
    end
end
