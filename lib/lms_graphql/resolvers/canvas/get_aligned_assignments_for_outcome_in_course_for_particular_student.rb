require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_alignment"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAlignedAssignmentsForOutcomeInCourseForParticularStudent < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasOutcomeAlignment], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :student_id, ID, required: false
        def resolve(course_id:, student_id: nil, get_all: false)
          result = context[:canvas_api].call("GET_ALIGNED_ASSIGNMENTS_FOR_OUTCOME_IN_COURSE_FOR_PARTICULAR_STUDENT").proxy(
            "GET_ALIGNED_ASSIGNMENTS_FOR_OUTCOME_IN_COURSE_FOR_PARTICULAR_STUDENT",
            {
              "course_id": course_id,
              "student_id": student_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end