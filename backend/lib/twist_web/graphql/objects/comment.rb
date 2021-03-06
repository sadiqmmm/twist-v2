require_relative 'user'

module Twist
  module Web
    module GraphQL
      class CommentType < ::GraphQL::Schema::Object
        graphql_name "Comment"
        description "A comment"

        field :id, ID, null: false
        field :createdAt, String, null: false
        field :text, String, null: false
        field :user, UserType, null: false

        def created_at
          object.created_at.iso8601
        end

        def user
          context[:user_loader].load(object.user_id)
        end
      end
    end
  end
end
