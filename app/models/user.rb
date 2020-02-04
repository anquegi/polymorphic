class User < ApplicationRecord
  has_many :subscriptions
  has_many :podcasts, through: :subscriptions, source: :subscribable, source_type: 'Podcast'
  has_many :newspapers, through: :subscriptions, source: :subscribable, source_type: 'Newspaper'
end
