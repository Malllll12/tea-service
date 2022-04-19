require 'rails_helper'

RSpec.describe 'All of a customers subscriptions' do
  before :each do
    @customer = Customer.create!(first_name: "Mallory", last_name: "Vining", email: "fake@email.com", address: "123 Here")
    @tea_1 = Tea.create!(title: "Sleepy Time", description: "relaxing", temperature: 100, brew_time: 4)
    @tea_2 = Tea.create!(title: "Earl Grey", description: "elegant", temperature: 105, brew_time: 3)
    @tea_3 = Tea.create!(title: "Jasmine", description: "ethereal", temperature: 99, brew_time: 3)
    @subscription_1 = Subscription.create!(title: "Tea Party",
      price: 19.99,
      status: 0,
      frequency: 4,
      customer_id: @customer.id,
      tea_id: @tea_1.id)
    @subscription_2 = Subscription.create!(title: "Tea Party",
      price: 29.99,
      status: 1,
      frequency: 4,
      customer_id: @customer.id,
      tea_id: @tea_2.id)
    @subscription_3 = Subscription.create!(title: "Tea Party",
      price: 9.99,
      status: 0,
      frequency: 2,
      customer_id: @customer.id,
      tea_id: @tea_3.id)
  end

  it 'Returns all subscriptions for a customer' do
    get "/api/v1/subscriptions/#{@customer.id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    parsed = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed.count).to eq(3)

    parsed.each do |subscription|
      expect(subscription[:attributes][:price]).to be_a(Float)
      expect(subscription[:attributes][:status]).to be_a(String)
      expect(subscription[:attributes][:frequency]).to be_an(Integer)
      expect(subscription[:attributes][:customer_id]).to be_an(Integer)
      expect(subscription[:attributes][:tea_id]).to be_an(Integer)
    end
  end
end
