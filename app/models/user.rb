class User < ApplicationRecord
    # relationship
    has_many :user_families, dependent: :destroy
    has_many :families, through: :user_families, dependent: :destroy

    # validations
    validates :auth_id, { presence: true, uniqueness: true }
end
