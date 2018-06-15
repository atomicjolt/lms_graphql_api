require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Mutations
    module Canvas
      class SplitMergedUsersIntoSeparateUser < CanvasBaseMutation
        argument :id, ID, required: true
        field :user, [LMSGraphQL::Types::Canvas::User], null: false
        def resolve(id:)
          ctx[:canvas_api].proxy(
            "SPLIT_MERGED_USERS_INTO_SEPARATE_USERS",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end