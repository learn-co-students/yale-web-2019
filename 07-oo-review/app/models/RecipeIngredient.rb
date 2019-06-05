class RecipeIngredient

  attr_reader :ingredient, :recipe

  @@all = []

  def initialize(ingredient, recipe)
    @ingredient = ingredient
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end
end




# ### `RecipeIngredient`
# RecipeIngredient is the join between an ingredient and a recipe.  This is a has-many-through relationship
# Build the following methods on the RecipeIngredient class
#
# - `RecipeIngredient.all`
# should return all of the RecipeIngredient instances
# - `RecipeIngredient#ingredient`
# should return the ingredient instance
# - `RecipeIngredient#recipe`
# should return the recipe instance
