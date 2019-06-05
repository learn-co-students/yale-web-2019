require_relative '../config/environment.rb'


prince = User.new("Prince")
peter = User.new("Peter")
roxanne = User.new("Roxanne")

recipe1 = Recipe.new
recipe2 = Recipe.new

ing1 = Ingredient.new("Cheese")
ing2 = Ingredient.new("Tomato")
ing3 = Ingredient.new("Dough")

ing4 = Ingredient.new("Basil")

ing_list1 = [ing1, ing2, ing3]
ing_list2 = [ing1, ing2, ing4]

recipe1.add_ingredients(ing_list1)
recipe2.add_ingredients(ing_list2)

prince_allergen = Allergy.new(prince, ing1)
roxanne_allergen = Allergy.new(roxanne, ing4)
peter_allergen = Allergy.new(peter, ing4)

prince.add_recipe_card(recipe1, "2019-06-03", 5)
roxanne.add_recipe_card(recipe1, "2019-06-03", 3)
peter.add_recipe_card(recipe2, "2019-05-31", 1)



binding.pry
