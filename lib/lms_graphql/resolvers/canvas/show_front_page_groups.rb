require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowFrontPageGroup < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPage, null: false
        argument :group_id, ID, required: true
        def resolve(group_id:)
          context[:canvas_api].call("SHOW_FRONT_PAGE_GROUPS").proxy(
            "SHOW_FRONT_PAGE_GROUPS",
            {
              "group_id": group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end