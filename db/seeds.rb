# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


IngredientQuantity.destroy_all
Step.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
UserFamily.destroy_all
Family.destroy_all
User.destroy_all


user = User.create(auth_id: 'hi')

family = Family.create(name: 'Polcari')

user_family = UserFamily.create(user_id: user.id, family_id: family.id, head: true)

recipe = Recipe.create(family_id: family.id, name: 'Pasta', prep_time: 30, cuisine_type: 'Italian')

step1 = Step.create(recipe_id: recipe.id, number: 1, directions: 'Boil water')
step2 = Step.create(recipe_id: recipe.id, number: 2, directions: 'Add pasta and boil for 15 minutes')
step3 = Step.create(recipe_id: recipe.id, number: 3, directions: 'Drain water')

ingredient1 = Ingredient.create(name: 'Pasta')
ingredient2 = Ingredient.create(name: 'Water')
ingredient3 = Ingredient.create(name: 'Salt')
ingredient4 = Ingredient.create(name: 'Tomato Sauce')

ingredient_quantity1 = IngredientQuantity.create(ingredient_id: ingredient1.id, recipe_id: recipe.id, quantity: 1, unit: 'lb', description: 'Uncooked pasta')
ingredient_quantity2 = IngredientQuantity.create(ingredient_id: ingredient2.id, recipe_id: recipe.id, quantity: 3, unit: 'quarts', description: 'Room temp')
ingredient_quantity3 = IngredientQuantity.create(ingredient_id: ingredient3.id, recipe_id: recipe.id, quantity: 2, unit: 'pinch', description: 'Iodized')
ingredient_quantity4 = IngredientQuantity.create(ingredient_id: ingredient4.id, recipe_id: recipe.id, quantity: 1, unit: 'jar', description: 'Homemade')