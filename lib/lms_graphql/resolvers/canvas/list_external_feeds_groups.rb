require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/external_feed"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListExternalFeedsGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::ExternalFeed], null: false
        argument :group_id, ID, required: true
        def resolve(group_id:)
          context[:canvas_api].proxy(
            "LIST_EXTERNAL_FEEDS_GROUPS",
            {
              "group_id": group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end