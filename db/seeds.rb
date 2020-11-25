# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ["food", "sport", "electronic", "clothes", "furnitures"]
categories.each do |category|
  Category.create({name: category})
end

variants = ["color", "size"]
variants.each do |variant|
  VariantType.create({name: variant})
end

User.create({
                name: "admin",
                email: "admin@admin.com",
                password_digest: User.digest("admin123")
            })