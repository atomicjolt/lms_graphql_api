require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_export"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListContentExportsGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasContentExport], null: false
        argument :get_all, Boolean, required: false
        argument :group_id, ID, required: true
        def resolve(group_id:, get_all: false)
          result = context[:canvas_api].call("LIST_CONTENT_EXPORTS_GROUPS").proxy(
            "LIST_CONTENT_EXPORTS_GROUPS",
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