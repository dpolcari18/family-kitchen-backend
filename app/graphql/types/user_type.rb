module Types
  class UserType < Types::BaseObject
    # Model Fields 
    field :id, ID, null: false
    field :auth_id, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Custom Fields
    field :families, [Types::FamilyType], null: false
  end
end
