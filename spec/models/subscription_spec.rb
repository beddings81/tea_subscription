require 'rails_helper'

RSpec.describe Subscription do
  describe 'association' do
    it { should belong_to(:customer)}
    it { should have_many(:tea_subscriptions)}
    it { should have_many(:teas).through(:tea_subscriptions)}
  end
end