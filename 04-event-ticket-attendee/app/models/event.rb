class Event


  attr_reader :name, :total_cost, :ticket_price, :venue
  # When an instance calls this method, they can access
  # the instance variable with the same name

  # An instance variable is an attribute in the class
  # can be found either by the attr_* macros or in initialize

  @@all = []

  def initialize(name, total_cost, ticket_price, venue)
    # Instance variables will go here
    @name = name
    @total_cost = total_cost
    @ticket_price = ticket_price
    @venue = venue

    @@all << self
  end


  def self.all
    @@all
  end

  def tickets
    Ticket.all.select do |ticket|
      ticket.event == self
    end
  end

  def sell_to_break_even
    # Total Cost
    # Each event has a ticket price
    if self.tickets.length * self.ticket_price > self.total_cost
      0
    else
      (self.total_cost - (self.tickets.length * self.ticket_price)) / self.ticket_price
    end
  end

  def revenue
    self.tickets.length * self.ticket_price
  end


  def attendees
    self.tickets.map do |ticket|
      ticket.attendee
    end
  end

  def average_age
    sum_age = 0
    self.attendees.each do |attendee|
      sum_age += attendee.age
    end

    sum_age * 1.0 / self.attendees.length
  end
end

##### Event.all
  # Returns an array of all Events
# Event#sales_to_break_even
  # Returns the number of Tickets that still need to be "purchased" for this Event before the Event reaches the break-even point.
  # If the Event has sold enough Tickets to break-even, return the number 0.
# Event#attendees
  # Returns an array of Attendee that have Tickets for the Event
# Event#average_age
  # Returns the average age of all the Attendees that will be at the Event
