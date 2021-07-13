module Types
  class UserFamilyType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: true
    field :family_id, Integer, null: true
    field :head, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
