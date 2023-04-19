class Tea < ApplicationRecord
  has_many :subscriptions

  validates_presence_of :title, :description, :brew_time
end