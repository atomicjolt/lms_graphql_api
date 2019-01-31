require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grading_standard"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleGradingStandardInContextCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasGradingStandard, null: false
        argument :course_id, ID, required: true
        argument :grading_standard_id, ID, required: true
        def resolve(course_id:, grading_standard_id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_GRADING_STANDARD_IN_CONTEXT_COURSES").proxy(
            "GET_SINGLE_GRADING_STANDARD_IN_CONTEXT_COURSES",
            {
              "course_id": course_id,
              "grading_standard_id": grading_standard_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end