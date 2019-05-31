class Ticket

  attr_reader :attendee, :event

  @@all = []

  def initialize(attendee, event)
    @attendee = attendee
    @event = event

    @@all << self
  end

  def self.all
    @@all
  end
end

# Ticket.all
    # Returns an array of all Ticket instances
