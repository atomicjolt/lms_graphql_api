require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_export"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowContentExportUser < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasContentExport, null: false
        argument :user_id, ID, required: true
        argument :id, ID, required: true
        def resolve(user_id:, id:, get_all: false)
          result = context[:canvas_api].call("SHOW_CONTENT_EXPORT_USERS").proxy(
            "SHOW_CONTENT_EXPORT_USERS",
            {
              "user_id": user_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end