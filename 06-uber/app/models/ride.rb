class Ride

  @@all = []

  attr_reader :driver, :passenger
  attr_accessor :distance

  # ride = Ride.new(driver, passenger, 1.030)
  # ride.distance += 10

  def initialize(driver, passenger, distance)
    @driver = driver
    @passenger = passenger
    @distance = distance

    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_distance
    # Find the sum of all the distances
    # Divide by the number of rides

    sum = @@all.inject(0) do |acc, ride|
      acc + ride.distance
    end

    # sum = 0
    # @@all.each do { |ride| sum += ride.distance }

    sum * 1.0 / @@all.length
  end

end
