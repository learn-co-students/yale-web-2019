class Venue

  @@all = []

  def initialize(name, location, rental_fee)
    @name = name
    @location = location
    @rental_fee = rental_fee

    @@all << self
  end

  def self.all
    @@all
  end

  def events
    Event.all.select do |event|
      event.venue == self
    end
  end

  def attendees
    all_attendees = []
    self.events.each do |event|
      event.attendees.each do |attendee|
        all_attendees << attendee
      end
    end

    all_attendees

    # self.events.map do |event|
    #   event.attendees
    # end.flatten
  end
end

def revenue
  sum = 0
  self.events.each do |event|
    sum += event.revenue
  end

  sum
end


# + `Venue.all`
#   + Returns an array of all `Venue`s
# + `Venue#events`
#   + Returns an array of `Event`s that are take place at this `Venue`
# + `Venue#revenue`
#   + Returns the total amount of money the venue has made from hosting `Event`s
# + `Venue#attendees`
#   + Returns an array of every `Attendee` that has purchased a `Ticket` for an `Event` held at this `Venue`
#
# ## Bonus Method
#
# + `Venue.guest_lists`
#   + Returns an array of hashes for each `Event` being held at this particular `Venue`. Each hash will have the keys "name", and "guest_list", where "name" returns a string of the name of the `Event`, and "guest_list" returns an array of `Attendee`s attending that event.
