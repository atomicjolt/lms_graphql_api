require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_revision"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowRevisionCoursesLatest < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPageRevision, null: false
        argument :course_id, ID, required: true
        argument :url, String, required: true
        argument :summary, Boolean, required: false
        def resolve(course_id:, url:, summary: nil, get_all: false)
          result = context[:canvas_api].call("SHOW_REVISION_COURSES_LATEST").proxy(
            "SHOW_REVISION_COURSES_LATEST",
            {
              "course_id": course_id,
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