require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowProvisionalGradeStatusForStudent < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :student_id, ID, required: false
        def resolve(course_id:, assignment_id:, student_id: nil, get_all: false)
          result = context[:canvas_api].call("SHOW_PROVISIONAL_GRADE_STATUS_FOR_STUDENT").proxy(
            "SHOW_PROVISIONAL_GRADE_STATUS_FOR_STUDENT",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
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