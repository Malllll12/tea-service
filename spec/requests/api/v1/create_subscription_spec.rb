require 'rails_helper'

RSpec.describe 'Create a customer subscription' do
  before :each do
    @customer = Customer.create!(first_name: "Mallory", last_name: "Vining", email: "fake@email.com", address: "123 Here")
    @tea = Tea.create!(title: "Sleepy Time", description: "relaxing", temperature: 100, brew_time: 4)
  end

  it 'creates a subscription' do
    info = { title: "Tea for Two",
                            price: 19.99,
                            status: 0,
                            frequency: 3,
                            customer_id: @customer.id,
                            tea_id: @tea.id
                          }
    post "/api/v1/subscriptions", params: info, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(201)

    parsed = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed).to be_a(Hash)
    expect(parsed[:type]).to eq("subscription")
    expect(parsed[:attributes][:title]).to be_a(String)
    expect(parsed[:attributes][:price]).to be_a(Float)
    expect(parsed[:attributes][:status]).to be_a(String)
    expect(parsed[:attributes][:frequency]).to be_an(Integer)
    expect(parsed[:attributes][:customer_id]).to be_an(Integer)
    expect(parsed[:attributes][:tea_id]).to be_an(Integer)
  end

  it 'cannot create a subscription with missing info' do
    info = { title: "Tea for Two",
                            price: 19.99,
                            status: 0,
                            frequency: 3,
                            customer_id: nil,
                            tea_id: @tea.id
                          }
    post "/api/v1/subscriptions", params: info, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
