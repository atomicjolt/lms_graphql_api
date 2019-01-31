require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetUserInACourseLevelAssignmentDatum < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :student_id, ID, required: true
        def resolve(course_id:, student_id:, get_all: false)
          result = context[:canvas_api].call("GET_USER_IN_A_COURSE_LEVEL_ASSIGNMENT_DATA").proxy(
            "GET_USER_IN_A_COURSE_LEVEL_ASSIGNMENT_DATA",
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