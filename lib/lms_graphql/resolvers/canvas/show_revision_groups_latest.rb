require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_revision"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowRevisionGroupsLatest < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPageRevision, null: false
        argument :group_id, ID, required: true
        argument :url, String, required: true
        argument :summary, Boolean, required: false
        def resolve(group_id:, url:, summary: nil, get_all: false)
          result = context[:canvas_api].call("SHOW_REVISION_GROUPS_LATEST").proxy(
            "SHOW_REVISION_GROUPS_LATEST",
            {
              "group_id": group_id,
              "url": url,
              "summary": summary            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end