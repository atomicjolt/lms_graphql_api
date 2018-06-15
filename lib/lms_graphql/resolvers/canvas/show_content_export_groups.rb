require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_export"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowContentExportGroup < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasContentExport, null: false
        argument :group_id, ID, required: true
        argument :id, ID, required: true
        def resolve(group_id:, id:)
          context[:canvas_api].call("SHOW_CONTENT_EXPORT_GROUPS").proxy(
            "SHOW_CONTENT_EXPORT_GROUPS",
            {
              "group_id": group_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end