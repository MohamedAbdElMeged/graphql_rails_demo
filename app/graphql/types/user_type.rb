# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :posts_count, Integer, null: true
    field :posts, [Types::PostType], null: true
    field :order_data, Types::OrderDataType, null: true

    def posts_count
      object.posts.size
    end

    def order_data
      JSON.parse!(object.order_data)
    end
  end
end
