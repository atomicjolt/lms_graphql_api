require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ModeratedGradingShowProvisionalGradeStatusForStudent < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :anonymous_id, ID, required: false
        def resolve(course_id:, assignment_id:, anonymous_id: nil)
          context[:canvas_api].call("MODERATED_GRADING_SHOW_PROVISIONAL_GRADE_STATUS_FOR_STUDENT").proxy(
            "MODERATED_GRADING_SHOW_PROVISIONAL_GRADE_STATUS_FOR_STUDENT",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "anonymous_id": anonymous_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end