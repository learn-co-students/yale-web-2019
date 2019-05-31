class Follower

  attr_accessor :name, :age, :life_motto

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto

    @@all << self
  end

  def self.all
    @@all
  end

  def join_cult(cult, initiation_date)
    BloodOath.new(cult, self, initiation_date)
  end

  def cults
    BloodOath.all.select do |blood_oath|
      blood_oath.follower == self
    end.map do |blood_oath|
      blood_oath.cult
    end
  end

  def self.of_a_certain_age(age)
    @@all.select do |follower|
      follower.age >= age
    end
  end

  def my_cults_slogans
    self.cults.each do |cult|
      puts cult.slogan
    end
  end


  def self.most_active
    self.all.max_by do |follower|
      follower.cults.size
    end
  end

  def self.top_ten
    reversed_followers = self.all.sort_by do |follower|
      follower.cults.size
    end.reverse

    reversed_followers[0..9]
  end
  # * `Follower#my_cults_slogans`
  #   * prints out all of the slogans for this follower's cults
  # * `Follower.most_active`
  #   * returns the `Follower` instance who has joined the most cults
  # * `Follower.top_ten`
  #   * returns an `Array` of followers; they are the ten most active followers


  # Follower#cults`
  #   * returns an `Array` of this follower's cults
end
