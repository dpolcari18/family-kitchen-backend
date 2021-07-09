class Family < ApplicationRecord
    # relationships
    has_many :user_families
    has_many :users, through: :user_families
    has_many :recipes, dependent: :destroy

    # validations
    validates :name, presence: true, uniqueness: true
end
