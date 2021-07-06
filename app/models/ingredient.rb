class Ingredient < ApplicationRecord
    has_many :ingredient_quantities
    has_many :recipes, through: :ingredient_quantities
end
