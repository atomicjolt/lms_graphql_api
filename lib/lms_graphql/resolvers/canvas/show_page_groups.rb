require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowPageGroup < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPage, null: false
        argument :group_id, ID, required: true
        argument :url, String, required: true
        def resolve(group_id:, url:, get_all: false)
          result = context[:canvas_api].call("SHOW_PAGE_GROUPS").proxy(
            "SHOW_PAGE_GROUPS",
            {
              "group_id": group_id,
              "url": url            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end