require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_share"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListContentSharesReceived < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasContentShare], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        def resolve(user_id:, get_all: false)
          result = context[:canvas_api].call("LIST_CONTENT_SHARES_RECEIVED").proxy(
            "LIST_CONTENT_SHARES_RECEIVED",
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