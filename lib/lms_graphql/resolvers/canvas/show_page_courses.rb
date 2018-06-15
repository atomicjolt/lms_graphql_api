require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowPageCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPage, null: false
        argument :course_id, ID, required: true
        argument :url, String, required: true
        def resolve(course_id:, url:)
          context[:canvas_api].call("SHOW_PAGE_COURSES").proxy(
            "SHOW_PAGE_COURSES",
            {
              "course_id": course_id,
              "url": url            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end