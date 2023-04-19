class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create!(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: 201
  end

  private

  def subscription_params
    params.require(:subscription).permit(:customer_id, :tea_id, :title, :price, :frequency)
  end
end