require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetRubricAssessmentsReadStateCoursesRubricComment < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :user_id, ID, required: true
        def resolve(course_id:, assignment_id:, user_id:, get_all: false)
          result = context[:canvas_api].call("GET_RUBRIC_ASSESSMENTS_READ_STATE_COURSES_RUBRIC_COMMENTS").proxy(
            "GET_RUBRIC_ASSESSMENTS_READ_STATE_COURSES_RUBRIC_COMMENTS",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "user_id": user_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end