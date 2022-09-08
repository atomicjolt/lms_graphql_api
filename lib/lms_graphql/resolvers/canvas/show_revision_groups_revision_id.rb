require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_revision"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowRevisionGroupsRevisionId < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPageRevision, null: false
        argument :group_id, ID, required: true
        argument :url_or_id, ID, required: true
        argument :revision_id, ID, required: true
        argument :summary, Boolean, required: false
        def resolve(group_id:, url_or_id:, revision_id:, summary: nil, get_all: false)
          result = context[:canvas_api].call("SHOW_REVISION_GROUPS_REVISION_ID").proxy(
            "SHOW_REVISION_GROUPS_REVISION_ID",
            {
              "group_id": group_id,
              "url_or_id": url_or_id,
              "revision_id": revision_id,
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