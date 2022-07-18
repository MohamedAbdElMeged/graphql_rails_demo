module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::User::Create
    field :create_post, mutation: Mutations::Post::Create
  end
end
