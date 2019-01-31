require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/avatar"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAvatarOption < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAvatar], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        def resolve(user_id:, get_all: false)
          result = context[:canvas_api].call("LIST_AVATAR_OPTIONS").proxy(
            "LIST_AVATAR_OPTIONS",
            {
              "user_id": user_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end