class RecipeCard

  @@all = []

  attr_reader :date, :rating, :user, :recipe

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating

    @@all << self
  end
  
  def self.all
    @@all
  end
end
