# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Product Brands and Category User delete all"
puts "Generating new Product, Category, Brand, User"

Product.destroy_all
Category.destroy_all
Brand.destroy_all
User.destroy_all

User.create(
  email: "john@example.com",
  password: "password"
)

4.times do
  Category.create(
    name: Faker::Commerce.department(max: 1)
  )
end

4.times do
  Brand.create(
    name: Faker::Device.manufacturer
  )
end

categories = Category.all
brands = Brand.all


15.times do
  p = Product.create(
    name: Faker::Commerce.unique.product_name,
    price: Faker::Number.decimal(l_digits: 2),
    category: categories[rand(4)],
    brand: brands[rand(4)]
  )
  puts "generating - product - #{p.name}"
  downloaded_image = URI.open("https://source.unsplash.com/700x400/?#{p.name.split.last}")
  p.main_image.attach(io: downloaded_image, filename: "mi_#{p.id}.png")

end
