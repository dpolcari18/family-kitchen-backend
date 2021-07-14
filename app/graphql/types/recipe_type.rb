module Types
  class RecipeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :prep_time, Integer, null: false
    field :cuisine_type, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :family_id, Integer, null: false
  end
end
