class Recipe < ApplicationRecord
    # relationships
    belongs_to :family
    has_many :steps, dependent: :destroy
    has_many :ingredient_quantities, dependent: :destroy
    has_many :ingredients, through: :ingredient_quantities, dependent: :destroy

    # validations
    validates :family_id, :name, :prep_time, :cuisine_type, presence: true
end
