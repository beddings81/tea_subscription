class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :customer_id, :tea_id, :title, :price, :frequency, :status
  
end