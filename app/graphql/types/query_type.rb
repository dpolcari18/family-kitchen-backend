module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :user, Types::UserType, null: false, description: "Returns user specific information based on id parameter." do
      argument :id, Integer, required: true
    end

    field :family, Types::FamilyType, null: false, description: "Returns family specific information based on id parameter" do
      argument :id, Integer, required: true
    end

    field :recipe, Types::RecipeType, null: false, description: "Returns recipe specific information based on id parameter" do
      argument :id, Integer, required: true
    end

    def user(params)
      User.find_by(id: params[:id])
    end

    def family(params)
      Family.find_by(id: params[:id])
    end

    def recipe(params) 
      Recipe.find_by(id: params[:id])
    end
  end
end
