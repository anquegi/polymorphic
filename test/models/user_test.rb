require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "has many subscriptions" do
      user = User.new
      subscription1 = user.subscriptions.new
      subscription2 = user.subscriptions.new
      assert_equal(user.subscriptions.length, 2)
      assert_equal(user.subscriptions[0], subscription1)
      assert_equal(user.subscriptions[1], subscription2) 
    end
    test "belongs to a user" do
      user = User.new
      subscription = Subscription.new(user: user)
      assert_equal(subscription.user, user)
    end
    test "has many podcasts through subscriptions" do
      user = User.create
      podcast1 = Podcast.create
      subscription1 = user.subscriptions.create(subscribable: podcast1)
      podcast2 = Podcast.create
      subscription2 = user.subscriptions.create(subscribable: podcast2)
      assert_equal(user.podcasts.length, 2)
      assert_equal(user.podcasts[0], podcast1)
      assert_equal(user.podcasts[1], podcast2) 
    end
    test "has many newspapers through subscriptions" do
      user = User.create
      newspaper1 = Newspaper.create
      subscription1 = user.subscriptions.create(subscribable: newspaper1)
      newspaper2 = Newspaper.create
      subscription2 = user.subscriptions.create(subscribable: newspaper2)
      assert_equal(user.newspapers.length, 2)
      assert_equal(user.newspapers[0], newspaper1)
      assert_equal(user.newspapers[1], newspaper2) 
    end
end
