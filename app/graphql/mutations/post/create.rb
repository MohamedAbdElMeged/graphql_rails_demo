module Mutations
  module Post
    class Create < Mutations::BaseMutation
      argument :title, String, required: true
      argument :body, String, required: true
      argument :user_id, ID, required: true
      field :post, Types::PostType, null: false
      field :errors, [String], null: false
      def resolve(title:, body:, user_id:)
        post = ::Post.new(title:, body:, user_id:)
        if post.save!
          {
            post:,
            errors: []
          }
        else
          {
            post: nil,
            errors: post.errors.full_messages
          }
        end
      end
    end
  end
end
