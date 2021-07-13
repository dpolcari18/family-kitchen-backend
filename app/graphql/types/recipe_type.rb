module Types
  class RecipeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :prep_time, Integer, null: true
    field :cuisine_type, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :family_id, Integer, null: true
  end
end
