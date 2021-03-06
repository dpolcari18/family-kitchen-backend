module Types
  class FamilyType < Types::BaseObject
    # Model Fields
    field :id, ID, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Custom Fields
    field :recipes, [Types::RecipeType], null: false
  end
end
