class Cult

  attr_reader :name, :location, :founding_year, :slogan

  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan

    @@all << self
  end

  # Class Method
  def self.all
    @@all
  end

  def self.find_by_name(cult_name)
    self.all.find do |cult|
      cult.name == cult_name
    end
  end

  def self.find_by_location(location_string)
    self.all.select do |cult|
      cult.location == location_string
    end
  end

  def self.find_by_founding_year(year)
    # All of the cults that were found in the given year
    self.all.select do |cult|
      cult.founding_year == year
    end
  end

  def recruit_follower(follower, initiation_date)
    BloodOath.new(self, follower, initiation_date)
  end

  def followers
    BloodOath.all.select do |bo|
      bo.cult == self
    end.map do |bo|
      bo.follower
    end
  end

  def cult_population
    self.followers.count
  end

  def average_age
    # Find all of the cult members (aka followers)
    # Then find out their average age
      # - Find the sum of ages
      # - Divide by the number of followers
    sum = 0
    self.followers.each do |follower|
      sum += follower.age
    end

    sum * 1.0 / self.cult_population
  end

  def my_followers_mottos
    self.followers.each do |follower|
      puts follower.life_motto
    end

    # self.followers.map do |follower|
    #   follower.life_motto
    # end
  end

  def self.least_popular
    self.all.min_by { |cult| cult.cult_population }
  end

  def self.most_common_location
    locations = {}

    # self.all.each do |cult|
    #   if !locations.keys.include?(cult.location)
    #     locations[cult.location] = 0
    #   end
    #
    #   location[cult.location] += 1
    # end

    self.all.each do |cult|
      if locations[cult.location]
        locations[cult.location] += 1
      else
        locations[cult.location] = 1
      end
    end

    locations.max_by do |location_str, num|
      num
    end[0]
  end

  # * `Cult#average_age`
  #   * returns a `Float` that is the average age of this cult's followers
  # * `Cult#my_followers_mottos`
  #   * prints out all of the mottos for this cult's followers
  # * `Cult.least_popular`
  #   * returns the `Cult` instance who has the least number of followers :(
  # * `Cult.most_common_location`
  #   * returns a `String` that is the location with the most cults




  # * `Cult#recruit_follower`
  #   * takes in an argument of a `Follower` instance and adds them to this cult's list of followers

  # def name
  #   @name
  # end
end
