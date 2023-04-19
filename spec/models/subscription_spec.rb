require 'rails_helper'

RSpec.describe Subscription do
  describe 'association' do
    it { should belong_to(:customer)}
    it { should have_many(:tea_subscriptions)}
    it { should have_many(:teas).through(:tea_subscriptions)}
  end

  describe 'validations' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:status)}
    it { should validate_presence_of(:frequency)}
  end
end