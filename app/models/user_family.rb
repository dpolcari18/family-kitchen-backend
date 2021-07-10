class UserFamily < ApplicationRecord
    # relationship
    belongs_to :user
    belongs_to :family

    # validations
    validates :user_id, :family_id, :head, presence: true
    validates_uniqueness_of :user_id, { scope: :family_id, message: 'is already a member of this family.' }
end
