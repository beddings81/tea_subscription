require 'rails_helper'

describe 'Update subscription endpoint' do
  describe 'Patch /subscriptions/:id' do
    describe 'happy path' do
      it 'cancels a subscription' do
        customer = create(:customer)
        tea = create(:tea)
        subscription = create(:subscription, customer_id: customer.id, tea_id: tea.id)

        old_subscription = Subscription.last

        patch "/api/v1/subscriptions/#{subscription.id}"

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response.status).to eq(200)
        
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
        expect(response_body[:data][:attributes][:status]).to_not eq(old_subscription.status)
      end

      it 'activates a subscription' do
        customer = create(:customer)
        tea = create(:tea)
        subscription = create(:subscription, customer_id: customer.id, tea_id: tea.id, status: 1)

        old_subscription = Subscription.last

        patch "/api/v1/subscriptions/#{subscription.id}"

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response.status).to eq(200)
        
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
        expect(response_body[:data][:attributes][:status]).to_not eq(old_subscription.status)
      end
    end
    
    describe 'sad path' do
      it 'returns an error if the subscription ID is not valid' do
        patch "/api/v1/subscriptions/1"

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to eq(404)
        
        expect(response_body).to be_a(Hash)
        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to be_a(Array)
        expect(response_body[:error][0]).to have_key(:title)
        expect(response_body[:error][0]).to have_key(:status)
      end
    end
  end
end