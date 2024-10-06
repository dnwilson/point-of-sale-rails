# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  {
    name: "Ackee & Saltfish",
    price: "12.50",
    image: "ackee-and-saltfish.jpg"
  },
  {
    name: "Callaloo & Breadfruit",
    price: "12.50",
    image: "callaloo-and-breadfruit.jpg"
  },
  {
    name: "Cornmeal Porridge",
    price: "5.00",
    image: "cornmeal-porridge.jpeg"
  },
  {
    name: "Chicken Foot Soup",
    price: "7.50",
    image: "chicken-foot-soup.jpeg"
  },
  {
    name: "Red Peas Soup",
    price: "7.50",
    image: "red-peas-soup.jpg"
  },
  {
    name: "Cow Foot",
    price: "12.50",
    image: "cow-foot.jpg"
  },
  {
    name: "Jerk Chicken",
    price: "15.00",
    image: "jerk-chicken.jpeg"
  },
  {
    name: "Fried Chicken",
    price: "15.00",
    image: "fry-chicken.jpg"
  },
  {
    name: "Jerk Pork",
    price: "20.00",
    image: "jerk-pork.jpg"
  },
  {
    name: "Rasta Pasta",
    price: "20.00",
    image: "rasta-pasta.jpeg"
  },
  {
    name: "Oxtail",
    price: "20.00",
    image: "oxtail.jpg"
  },
  {
    name: "Curry Goat",
    price: "20.00",
    image: "curry-goat.jpeg"
  }
].each do |hash|
  product = Product.create(name: hash[:name], price: hash[:price])
  file = File.open(Rails.root.join("db/images", hash[:image]))
  product.image.attach(io: file, filename: File.extname(file).delete_prefix("."))
end
