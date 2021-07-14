module Types
  class StepType < Types::BaseObject
    field :id, ID, null: false
    field :number, Integer, null: false
    field :directions, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :recipe_id, Integer, null: false
  end
end
