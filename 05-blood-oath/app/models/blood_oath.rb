class BloodOath

  attr_reader :cult, :follower, :initiation_date

  @@all = []

  def initialize(cult, follower, initiation_date)
    @cult = cult
    @follower = follower
    @initiation_date = initiation_date

    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    self.all.min_by do |blood_oath|
      blood_oath.initiation_date
    end.follower
  end

  # * `BloodOath.first_oath`
  #   * returns the `Follower` instance for the follower that made the very first blood oath

end
