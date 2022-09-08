require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowPageCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPage, null: false
        argument :course_id, ID, required: true
        argument :url_or_id, ID, required: true
        def resolve(course_id:, url_or_id:, get_all: false)
          result = context[:canvas_api].call("SHOW_PAGE_COURSES").proxy(
            "SHOW_PAGE_COURSES",
            {
              "course_id": course_id,
              "url_or_id": url_or_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end