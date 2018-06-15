require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/profile"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetUserProfile < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasProfile, null: false
        argument :user_id, ID, required: true
        def resolve(user_id:)
          context[:canvas_api].call("GET_USER_PROFILE").proxy(
            "GET_USER_PROFILE",
            {
              "user_id": user_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end