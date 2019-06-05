class Passenger

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def rides
    Ride.all.select do |ride|
      ride.passenger == self
    end
  end

  def drivers
    # x = []
    # Ride.all.each do |ride|
    #   if ride.passenger == self
    #     x << ride.driver
    #   end
    # end
    self.rides.map do |ride|
      ride.driver
    end
  end

  def total_distance
    sum = 0

    self.rides.each do |ride|
      sum += ride.distance
    end

    sum
  end

  def self.premium_members
    @@all.select do |passenger|
      passenger.total_distance > 100
    end
  end
end


# - ******`Passenger#name`
#   - Returns the name of the passenger
# - ***8`Passenger#rides`
#   - Returns an array of Ride instances that this person has been on
# - ****`Passenger#drivers`
#   - Returns an array of Driver instances that this person has rode with
# -***** `Passenger#total_distance`
#   - Returns the floating number that represents the total distance the passenger has travelled using the service
# -***** `Passenger.all`
#   - Returns an array of all Passengers
# -***** `Passenger.premium_members`
#   - Returns an array of all Passengers who have travelled over 100 miles in total with the service
