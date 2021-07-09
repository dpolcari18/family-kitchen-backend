class IngredientQuantity < ApplicationRecord
    # relationships
    belongs_to :recipe
    belongs_to :ingredient

    # validations
    validates :ingredient_id, :recipe_id, :quantity, :unit, presence: true
    validates :unit, inclusion: { in: %w(cup Oz flOz Tbsp tsp qt gal pt lb mL g kg l)}
end
