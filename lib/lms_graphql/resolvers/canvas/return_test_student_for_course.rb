require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ReturnTestStudentForCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasUser, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("RETURN_TEST_STUDENT_FOR_COURSE").proxy(
            "RETURN_TEST_STUDENT_FOR_COURSE",
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