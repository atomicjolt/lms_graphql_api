require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/history_entry"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListRecentHistoryForUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasHistoryEntry], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        def resolve(user_id:, get_all: false)
          result = context[:canvas_api].call("LIST_RECENT_HISTORY_FOR_USER").proxy(
            "LIST_RECENT_HISTORY_FOR_USER",
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