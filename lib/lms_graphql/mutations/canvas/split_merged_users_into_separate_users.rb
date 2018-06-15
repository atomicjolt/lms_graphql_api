require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Mutations
    module Canvas
      class SplitMergedUsersIntoSeparateUser < CanvasBaseMutation
        argument :id, ID, required: true
        field :user, [LMSGraphQL::Types::Canvas::CanvasUser], null: false
        def resolve(id:)
          context[:canvas_api].call("SPLIT_MERGED_USERS_INTO_SEPARATE_USERS").proxy(
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