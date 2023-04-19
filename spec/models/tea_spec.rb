require 'rails_helper'

RSpec.describe Tea do
  describe 'associations' do
    it { should have_many(:tea_subscriptions) }
    it { should have_many(:subscriptions).through(:tea_subscriptions)}
  end

  describe 'validations' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:brew_time)}

  end
end