require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


cult1 = Cult.new("Gigi's Minions", "New Haven", 2019, "My Preciouses")
cult2 = Cult.new("CS50", "Cambridge", 2000, "We love David Malan")
cult3 = Cult.new("Scientology", "New York", 2000, "Tom Cruise is our idol")

follower1 = Follower.new("Richard", 7, "Carpe Diem")
follower2 = Follower.new("Ganesh", 2, "Mo Monae, Mo Problemo")
follower3 = Follower.new("Rina", 1, "Be Happy")

cult1.recruit_follower(follower1, "2008-05-31")
cult3.recruit_follower(follower2, "1990-01-31")
cult2.recruit_follower(follower3, "2019-12-31")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
