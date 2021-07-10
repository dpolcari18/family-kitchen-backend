class Step < ApplicationRecord
    # relationship
    belongs_to :recipe

    # validations
    validates :recipe_id, :number, :directions, presence: true
    validates_uniqueness_of :recipe_id, { scope: :number, message: 'recipe already has a step with this number.' }
end
