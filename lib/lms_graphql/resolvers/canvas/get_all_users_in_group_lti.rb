require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAllUsersInGroupLti < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::User], null: false
        argument :group_id, ID, required: true
        def resolve(group_id:)
          context[:canvas_api].proxy(
            "GET_ALL_USERS_IN_GROUP_LTI",
            {
              "group_id": group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end