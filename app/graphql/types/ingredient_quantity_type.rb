module Types
  class IngredientQuantityType < Types::BaseObject
    field :id, ID, null: false
    field :ingredient_id, Integer, null: false
    field :recipe_id, Integer, null: false
    field :quantity, Integer, null: false
    field :unit, String, null: false
    field :description, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
