class User < ApplicationRecord
    has_many :user_families, dependent: :destroy
    has_many :families, through: :user_families, dependent: :destroy
end
