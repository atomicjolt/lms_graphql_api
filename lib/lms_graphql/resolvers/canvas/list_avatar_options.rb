require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/avatar"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAvatarOption < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::Avatar], null: false
        argument :user_id, ID, required: true
        def resolve(user_id:)
          context[:canvas_api].proxy(
            "LIST_AVATAR_OPTIONS",
            {
              "user_id": user_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end