FactoryBot.define do
  factory :product do
    name { "MyString" }
    price { "9.99" }
    brand
    category
    main_image { "image.png" }
  end
end
