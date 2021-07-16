module Types
  class StepType < Types::BaseObject
    # Model Fields
    field :id, ID, null: false
    field :number, Integer, null: false
    field :directions, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :recipe_id, Integer, null: false

    # Custom Fields
  end
end
