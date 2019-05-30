# * Create a Tweet class. The class should have these methods:
#   ******* `Tweet#message` that returns a string
#   ****** `Tweet#user` that returns an instance of the user class
#   * `Tweet.all` that returns all the Tweets created.
#   * `Tweet#username` that returns the username of the tweet's user

class Tweet
  # What is the data they need to come into existence?

  attr_reader :message, :user

  @@all = []

  # Tweet.new("Hey Prince lol", #<User:0x13d @name="Peter">)
  def initialize(message, user)
    # What is the data they need to remember over time?
    @message = message
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end


  def users
    # From Far Right to Far Left
    # - Tweet has many Likes
    # - Each Like belongs to a User and a Tweet
    # - Tweets has many users, through a Like
    Like.all.select do |like|
      like.tweet == self
    end.map do |like|
      like.user
    end

    # Like.all.select { |like| like.tweet == self }.map { |like| like.user}

  end
end





#
