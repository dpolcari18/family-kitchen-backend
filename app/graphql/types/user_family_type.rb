module Types
  class UserFamilyType < Types::BaseObject
    # Model Fields
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :family_id, Integer, null: false
    field :head, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Custom Fields
  end
end
