class Attendee

  attr_reader :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age

    @@all << self
  end


  def self.all
    @@all
  end

  def events
    Ticket.all.select do |ticket| # Find all the tickets that I have
      ticket.attendee == self
    end.map do |ticket| # For every ticket I have, give me the event
      ticket.event
    end
  end

  def money_spent
    # The event class has the ticket price
    total = 0
    self.events.each do |event|
      total += event.ticket_price
    end
    total
  end
end

# Attendee.all
  # Returns an array of all Attendees
# Attendee#events
  # Returns an array of all Events that the Attendee is attending.
# Attendee#money_spent
  # Returns the dollar amount this Attendee has spent on Tickets for Events
