require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_revision"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowRevisionCoursesRevisionId < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPageRevision, null: false
        argument :course_id, ID, required: true
        argument :url_or_id, ID, required: true
        argument :revision_id, ID, required: true
        argument :summary, Boolean, required: false
        def resolve(course_id:, url_or_id:, revision_id:, summary: nil, get_all: false)
          result = context[:canvas_api].call("SHOW_REVISION_COURSES_REVISION_ID").proxy(
            "SHOW_REVISION_COURSES_REVISION_ID",
            {
              "course_id": course_id,
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