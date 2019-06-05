class Ingredient

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def users # returns the array of users allergic to it
    Allergy.all.select do |allergy|
      allergy.ingredient == self
    end.map do |allergy|
      allergy.user
    end
  end

  def self.most_common_allergen
    @@all.max_by { |ingredient| ingredient.users.length }
  end
end



# Build the following methods on the Ingredient class
#
# - `Ingredient.all`
# should return all of the ingredient instances
# - `Ingredient.most_common_allergen`
# should return the ingredient instance that the highest number of users are allergic to
