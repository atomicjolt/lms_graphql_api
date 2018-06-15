require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_revision"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowRevisionCoursesRevisionId < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPageRevision, null: false
        argument :course_id, ID, required: true
        argument :url, String, required: true
        argument :revision_id, ID, required: true
        argument :summary, Boolean, required: false
        def resolve(course_id:, url:, revision_id:, summary: nil)
          context[:canvas_api].proxy(
            "SHOW_REVISION_COURSES_REVISION_ID",
            {
              "course_id": course_id,
              "url": url,
              "revision_id": revision_id,
              "summary": summary            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end