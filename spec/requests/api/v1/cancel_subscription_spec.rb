require 'rails_helper'

RSpec.describe 'Cancel a customer subscription' do
  before :each do
    @customer = Customer.create!(first_name: "Mallory", last_name: "Vining", email: "fake@email.com", address: "123 Here")
    @tea = Tea.create!(title: "Sleepy Time", description: "relaxing", temperature: 100, brew_time: 4)
    @subscription = Subscription.create!(title: "Tea for Two",
                            price: 19.99,
                            status: 0,
                            frequency: 3,
                            customer_id: @customer.id,
                            tea_id: @tea.id)
  end

  it 'cancels a subscription' do
    info = { title: "Tea for Two",
                            price: 19.99,
                            status: 1,
                            frequency: 3,
                            customer_id: @customer.id,
                            tea_id: @tea.id
                          }

    patch "/api/v1/subscriptions/#{@subscription.id}", params: info, as: :json

    subscription = Subscription.find_by(id: @subscription.id)
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed).to be_a(Hash)
    expect(parsed[:type]).to eq("subscription")
    expect(parsed[:attributes][:title]).to be_a(String)
    expect(parsed[:attributes][:price]).to be_a(Float)
    expect(parsed[:attributes][:status]).to eq("cancelled")
    expect(parsed[:attributes][:frequency]).to be_an(Integer)
    expect(parsed[:attributes][:customer_id]).to be_an(Integer)
    expect(parsed[:attributes][:tea_id]).to be_an(Integer)
  end

  it 'cannot cancel a subscription with incomplete data' do
    info = { title: "Tea for Two",
                            price: 19.99,
                            status: 1,
                            frequency: 3,
                            customer_id: nil,
                            tea_id: @tea.id
                          }

    patch "/api/v1/subscriptions/#{@subscription.id}", params: info, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
