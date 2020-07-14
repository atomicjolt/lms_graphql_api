require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/canvas{ "unread_count": "integer" }"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetUnreadSharesCount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::Canvas{ "unread_count": "integer" }, null: false
        argument :user_id, ID, required: true
        def resolve(user_id:, get_all: false)
          result = context[:canvas_api].call("GET_UNREAD_SHARES_COUNT").proxy(
            "GET_UNREAD_SHARES_COUNT",
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