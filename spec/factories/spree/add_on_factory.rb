FactoryGirl.define do
  factory :add_on, class: 'Spree::AddOn' do
    price 4.99
    sequence(:name) { |n| "AddOn ##{n} - #{Kernel.rand(9999)}" }
    description { Faker::Lorem.paragraphs(1) }
    association :product
  end
end
