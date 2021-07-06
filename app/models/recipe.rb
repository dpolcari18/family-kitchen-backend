class Recipe < ApplicationRecord
    belongs_to :family
    has_many :steps, dependent: :destroy
    has_many :ingredient_quantities, dependent: :destroy
    has_many :ingredients, through: :ingredient_quantities, dependent: :destroy
end
