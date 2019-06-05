class User

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipe_card(recipe, date, rating)
    # TODO
    RecipeCard.new(self, recipe, date, rating)
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
  end

  def recipes
    # An array of Recipe instances
    self.recipe_cards.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def allergens
    Allergy.all.select do |allergy|
      allergy.user == self
    end.map do |allergy|
      allergy.ingredient
    end
  end

  def top_three_recipes
    # Find the top three OF MY RECIPES
    cards = self.recipe_cards.sort_by do |recipe_card|
      recipe_card.rating
    end.reverse[0..2]

    cards.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def most_recent_recipe
    # Recipe that is the most recent
    self.recipe_cards.sort_by do |recipe_card|
      recipe_card.date
    end.last.recipe
  end

  def safe_recipes
    Recipe.all.select do |recipe|
      (self.allergens & recipe.ingredients).empty?
    end
  end
end


# - `User#declare_allergy`
# should accept an`Ingredient` instance as an argument, and create a new `Allergy` instance for this `User` and the given `Ingredient`
# - `User#allergens`
# should return all of the ingredients this user is allergic to
# - `User#top_three_recipes`
# should return the top three highest rated recipes for this user.
# - `User#most_recent_recipe`
# should return the recipe most recently added to the user's cookbook.
