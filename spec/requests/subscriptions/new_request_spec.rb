require 'rails_helper'

describe 'New subscription endpoint' do
  describe 'Post /subscriptions' do
    describe 'happy path' do
      it 'creates a new tea subscription' do
        customer = create(:customer)
        tea = create(:tea)

        subscription_params = {
          customer_id: customer.id,
          tea_id: tea.id,
          title: "Green Tea",
          price: 19.99,
          frequency: 1
        }

        headers = { "CONTENT_TYPE" => "application/json" }
        
        expect(Subscription.count).to eq(0)

        post "/api/v1/subscriptions", headers: headers, params: JSON.generate(subscription: subscription_params)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(Subscription.count).to eq(1)
        expect(response).to be_successful
        expect(response.status).to eq(201)

        expect(response_body).to be_a(Hash)
        expect(response_body).to have_key(:data)
        expect(response_body[:data]).to have_key(:id)
        expect(response_body[:data][:id]).to be_a(String)
        
        expect(response_body[:data]).to have_key(:type)
        expect(response_body[:data][:type]).to be_a(String)

        expect(response_body[:data]).to have_key(:attributes)
        expect(response_body[:data][:attributes]).to be_a(Hash)
        expect(response_body[:data][:attributes]).to have_key(:customer_id)
        expect(response_body[:data][:attributes][:customer_id]).to be_a(Integer)
        
        expect(response_body[:data][:attributes]).to have_key(:tea_id)
        expect(response_body[:data][:attributes][:tea_id]).to be_a(Integer)

        expect(response_body[:data][:attributes]).to have_key(:title)
        expect(response_body[:data][:attributes][:title]).to be_a(String)
        
        expect(response_body[:data][:attributes]).to have_key(:price)
        expect(response_body[:data][:attributes][:price]).to be_a(Float)

        expect(response_body[:data][:attributes]).to have_key(:frequency)
        expect(response_body[:data][:attributes][:frequency]).to be_a(String)

        expect(response_body[:data][:attributes]).to have_key(:status)
        expect(response_body[:data][:attributes][:status]).to be_a(String)
      end
    end

    describe 'sad path' do
      it 'returns an error if the response body is missing params' do
        customer = create(:customer)
        tea = create(:tea)

        subscription_params = {
          customer_id: customer.id,
          tea_id: tea.id,
          title: "",
          price: 19.99,
          frequency: ""
        }

        headers = { "CONTENT_TYPE" => "application/json" }
        
        expect(Subscription.count).to eq(0)

        post "/api/v1/subscriptions", headers: headers, params: JSON.generate(subscription: subscription_params)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(Subscription.count).to eq(0)
        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        expect(response_body).to be_a(Hash)
        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to be_a(Array)
        expect(response_body[:error][0]).to have_key(:title)
        expect(response_body[:error][0]).to have_key(:title)
        expect(response_body[:error][0]).to have_key(:status)
      end

      it 'returns an error if the customer/tea do not exist' do
        tea = create(:tea)

        subscription_params = {
          customer_id: 1,
          tea_id: tea.id,
          title: "Green Tea",
          price: 19.99,
          frequency: 0
        }

        headers = { "CONTENT_TYPE" => "application/json" }
        
        expect(Subscription.count).to eq(0)

        post "/api/v1/subscriptions", headers: headers, params: JSON.generate(subscription: subscription_params)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(Subscription.count).to eq(0)
        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        expect(response_body).to be_a(Hash)
        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to be_a(Array)
        expect(response_body[:error][0]).to have_key(:title)
        expect(response_body[:error][0]).to have_key(:status)
      end
    end
  end
end