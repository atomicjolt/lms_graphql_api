require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowFrontPageCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPage, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("SHOW_FRONT_PAGE_COURSES").proxy(
            "SHOW_FRONT_PAGE_COURSES",
            {
              "course_id": course_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end