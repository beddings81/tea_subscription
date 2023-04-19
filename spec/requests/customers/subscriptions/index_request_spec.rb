require 'rails_helper'

describe 'Customer subscriptions endpoint' do
  describe 'Get /customers/:id/subscriptions' do
    describe 'happy path' do
      it 'returns an array of a customers subscriptions' do
        customer = create(:customer)
        tea1 = create(:tea)
        tea2 = create(:tea)
        tea3 = create(:tea)
        subscription = create(:subscription, customer_id: customer.id, tea_id: tea1.id)
        subscription = create(:subscription, customer_id: customer.id, tea_id: tea2.id)
        subscription = create(:subscription, customer_id: customer.id, tea_id: tea3.id, status: 1)

        get "/api/v1/customers/#{customer.id}/subscriptions"

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response_body).to be_a(Hash)
        expect(response_body).to have_key(:data)
        expect(response_body[:data]).to be_a(Array)

        response_body[:data].each do |subscription|
          expect(subscription).to have_key(:id)
          expect(subscription[:id]).to be_a(String)

          expect(subscription).to have_key(:type)
          expect(subscription[:type]).to be_a(String)

          expect(subscription).to have_key(:attributes)
          expect(subscription[:attributes]).to be_a(Hash)

          expect(subscription[:attributes]).to have_key(:customer_id)
          expect(subscription[:attributes][:customer_id]).to be_a(Integer)
          
          expect(subscription[:attributes]).to have_key(:tea_id)
          expect(subscription[:attributes][:tea_id]).to be_a(Integer)

          expect(subscription[:attributes]).to have_key(:title)
          expect(subscription[:attributes][:title]).to be_a(String)

          expect(subscription[:attributes]).to have_key(:price)
          expect(subscription[:attributes][:price]).to be_a(Float)

          expect(subscription[:attributes]).to have_key(:frequency)
          expect(subscription[:attributes][:frequency]).to be_a(String)

          expect(subscription[:attributes]).to have_key(:status)
          expect(subscription[:attributes][:status]).to be_a(String)
        end
      end

      it 'returns an empty array if a customer has no subscriptions' do
        customer = create(:customer)
        tea1 = create(:tea)
        tea2 = create(:tea)
        tea3 = create(:tea)

        get "/api/v1/customers/#{customer.id}/subscriptions"

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response_body).to be_a(Hash)
        expect(response_body).to have_key(:data)
        expect(response_body[:data]).to be_a(Array)
        expect(response_body[:data]).to eq([])
      end
    end
  end
end
