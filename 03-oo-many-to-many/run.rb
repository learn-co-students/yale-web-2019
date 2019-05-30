require 'pry'

require_relative './tweet.rb'
require_relative './user.rb'
require_relative './like.rb'


prince = User.new("prince3000")
matt = User.new("matt04")
jenna = User.new("jz70")
jenna.post_tweet("Hi")
matt.post_tweet("Hi jz70")
prince.post_tweet("Rad")
prince.post_tweet("\"Send Tweet\"")

new_tweet = matt.post_tweet("Hello again")
prince.like_tweet(new_tweet)
jenna.like_tweet(new_tweet)




binding.pry
0 # Only here to make sure we hit the binding.pry
