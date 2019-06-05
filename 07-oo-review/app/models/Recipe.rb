class Recipe

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      # For every ingredient, I need aa recipeinregrient

      RecipeIngredient.new(ingredient, self)
    end
  end

  def ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end.map do |ri|
      ri.ingredient
    end
  end

  def allergens
    self.ingredients.find_all do |ingredient|
      Allergy.all.find do |allergy|
        allergy.ingredient == ingredient
      end

      # ingredient.users.count > 0
    end
    # allergic_ingredients = Allergy.all.map do |allergy|
    #   allergy.ingredient
    # end
    #
    # self.ingredients.select do |ingredient|
    #   allergic_ingredients.include?(ingredient)
    # end
  end

  def self.most_popular
  end
end

# ***Recipe.all should return all of the recipe instances
# Recipe.most_popular should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
# Recipe#users should return the user instances who have recipe cards with this recipe
# Recipe#ingredients should return all of the ingredients in this recipe
# Recipe#allergens should return all of the Ingredients in this recipe that are allergens for Users in our system.
# Recipe#add_ingredients should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
