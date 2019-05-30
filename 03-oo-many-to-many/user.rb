# * Create a User class. The class should have these methods:
#   ***** `#initialize` which takes a username and have
#   ****** a reader method for the username
#   * `#tweets` that returns an array of Tweet instances
#   * `#post_tweet` that take a message, creates a new tweet, and adds it to the
class User

  attr_reader :username

  def initialize(username)
    @username = username
  end

  def post_tweet(message)
    # self in an instance method is the instance
    # calling this method
    tweet = Tweet.new(message, self)
  end

  def like_tweet(tweet)
    # A new Like will require a user and a tweet
    Like.new(self, tweet)
  end

  def liked_tweets
    # We want to find all the tweets this user has liked
    # - Going to the like class and finding every like
    user_likes = Like.all.select do |like|
      like.user == self
    end
    # - Select all the ones that match this user
    # - Return an array of all of the tweets
    user_likes.map do |like|
      like.tweet
    end

    # Like.all.select do |like|
    #   like.user == self
    # end.map do |like|
    #   like.tweet
    # end
    #
  end


  def tweets
    # Finding all the tweets
    Tweet.all.select do |tweet|
      tweet.user == self
    end
    # Selecting out the ones that I wrote
  end





end
