class Step < ApplicationRecord
    # relationship
    belongs_to :recipe

    # validations
    validates :recipe_id, :number, :directions, presence: true
end
