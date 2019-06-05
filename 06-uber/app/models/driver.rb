class Driver

  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def rides
    Ride.all.select do |ride|
      ride.driver == self
    end
  end

  def passengers
    self.rides.map do |ride|
      ride.passenger
    end
  end

  def passenger_names
    self.passengers.uniq.map do |passenger|
      passenger.name
    end
  end

  def total_distance
    sum = 0

    self.rides.each do |ride|
      sum += ride.distance
    end

    sum
  end

  def self.mileage_cap(distance)
    @@all.select do |driver|
      driver.total_distance > distance
    end
    # self.all
  end
end



# ***- `Driver#name`
#   - Returns the driver's name
# - `Driver#passenger_names`
#   - Returns an array of all Passengers' names a driver has driven. The names should be **unique** (no repeats).
# - `Driver#rides`
#   - Returns an array of all Rides a driver has made
# - ***`Driver.all`
#   - Returns an array of all Drivers
# - `Driver.mileage_cap(distance)`
#   - Takes an argument of a distance (float) and returns an array of all Drivers who have driven over the mileage
