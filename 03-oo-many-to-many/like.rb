
# New Model: Like
#
# User ----< Like >----- Tweet
# From Far left to far Right
# - User has many likes
# - Each Like belongs to User and a Tweet
# - User has many Tweets, through a Like

# From Far Right to Far Left
# - Tweet has many Likes
# - Each Like belongs to a User and a Tweet
# - Tweets has many users, through a Like

class Like

  @@all = []

  attr_reader :user, :tweet

  def initialize(user, tweet)
    @user = user    # @user => is the user that made the like
    @tweet = tweet  # tweet.user => is the user that made the tweet

    @@all << self
  end

  def self.all
    @@all
  end
end
