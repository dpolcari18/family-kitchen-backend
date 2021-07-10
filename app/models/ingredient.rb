class Ingredient < ApplicationRecord
    # relationships
    has_many :ingredient_quantities
    has_many :recipes, through: :ingredient_quantities

    # validations
    validates :name, presence: true, { uniqueness: true, case_sensitive: false }
end
