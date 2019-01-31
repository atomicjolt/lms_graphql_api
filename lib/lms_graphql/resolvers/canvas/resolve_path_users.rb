require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ResolvePathUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasFolder], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        def resolve(user_id:, get_all: false)
          result = context[:canvas_api].call("RESOLVE_PATH_USERS").proxy(
            "RESOLVE_PATH_USERS",
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