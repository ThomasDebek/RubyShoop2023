FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "The Thing no #{n}" }
    price { 100 }
  end
end
