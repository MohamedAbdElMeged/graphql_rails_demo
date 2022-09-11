module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end
    field :order_data, Types::OrderDataType, null: false do
      argument :id, ID, required: true
    end
    def order_data(id:)
      JSON.parse!(User.find(id).order_data)
    end

    field :users, [Types::UserType], null: false
    def users
      User.all.includes(:posts)
    end
  end
end
