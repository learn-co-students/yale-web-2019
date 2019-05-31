require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Example of a variable definition that will be available in your Pry session once you've built out the model:
fyre_island = Venue.new("Fyre Island", "Bahamas", 800000)
fyre = Event.new("Fyre Festival", 100000000, 10000, fyre_island)
fyre2 = Event.new("Fyre Festival v2: Electric Boogaloo", 10000000000000, 1000, fyre_island)
prince = Attendee.new("Prince", 1)
alex = Attendee.new("Alex", 1)
leonie = Attendee.new("Leonie", 1)
Ticket.new(prince, fyre)
Ticket.new(prince, fyre2)
Ticket.new(leonie, fyre2)
Ticket.new(alex, fyre2)

beef = Event.new("Beef", 0, 10, fyre_island)
Ticket.new(prince, beef)
# lucy = Attendee.new("Lucy", 22)

#The variable `lucy` will point to an instance of a new attendee

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
