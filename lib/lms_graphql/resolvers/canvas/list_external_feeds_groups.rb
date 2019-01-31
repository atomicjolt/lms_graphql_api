require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/external_feed"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListExternalFeedsGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasExternalFeed], null: false
        argument :get_all, Boolean, required: false
        argument :group_id, ID, required: true
        def resolve(group_id:, get_all: false)
          result = context[:canvas_api].call("LIST_EXTERNAL_FEEDS_GROUPS").proxy(
            "LIST_EXTERNAL_FEEDS_GROUPS",
            {
              "group_id": group_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end