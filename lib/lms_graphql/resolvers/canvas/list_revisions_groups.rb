require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_revision"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListRevisionsGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasPageRevision], null: false
        argument :group_id, ID, required: true
        argument :url, String, required: true
        def resolve(group_id:, url:)
          context[:canvas_api].call("LIST_REVISIONS_GROUPS").proxy(
            "LIST_REVISIONS_GROUPS",
            {
              "group_id": group_id,
              "url": url            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end