# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer = Customer.create!(first_name: "Mallory", last_name: "Vining", email: "fake@email.com", address: "123 Here")
customer_2 = Customer.create!(first_name: "Pepper", last_name: "Vining", email: "faker@email.com", address: "123 THere")
tea_1 = Tea.create!(title: "Sleepy Time", description: "relaxing", temperature: 100, brew_time: 4)
tea_2 = Tea.create!(title: "Earl Grey", description: "elegant", temperature: 105, brew_time: 3)
tea_3 = Tea.create!(title: "Jasmine", description: "ethereal", temperature: 99, brew_time: 3)
subscription_1 = Subscription.create!(title: "Tea Party",
  price: 19.99,
  status: 0,
  frequency: 4,
  customer_id: customer.id,
  tea_id: tea_1.id)
subscription_2 = Subscription.create!(title: "Tea Party",
  price: 29.99,
  status: 1,
  frequency: 4,
  customer_id: customer.id,
  tea_id: tea_2.id)
subscription_3 = Subscription.create!(title: "Tea Party",
  price: 9.99,
  status: 0,
  frequency: 2,
  customer_id: customer_2.id,
  tea_id: tea_1.id)
