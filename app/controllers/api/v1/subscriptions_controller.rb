class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(Subscription.find(subscription.id)), status: 201
    else
      render json: { error: { details: "This subscription cannot be created"} }, status: 400
    end
  end

  private

  def subscription_params
    params.permit(:title, :price, :frequency, :status, :customer_id, :tea_id)
  end
end