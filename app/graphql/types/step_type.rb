module Types
  class StepType < Types::BaseObject
    field :id, ID, null: false
    field :number, Integer, null: true
    field :directions, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :recipe_id, Integer, null: true
  end
end
