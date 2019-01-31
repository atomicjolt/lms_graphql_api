require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grading_standard"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGradingStandardsAvailableInContextCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGradingStandard], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("LIST_GRADING_STANDARDS_AVAILABLE_IN_CONTEXT_COURSES").proxy(
            "LIST_GRADING_STANDARDS_AVAILABLE_IN_CONTEXT_COURSES",
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