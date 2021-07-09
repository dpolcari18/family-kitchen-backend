class IngredientQuantity < ApplicationRecord
    # relationships
    belongs_to :recipe
    belongs_to :ingredient

    # validations
    
end
