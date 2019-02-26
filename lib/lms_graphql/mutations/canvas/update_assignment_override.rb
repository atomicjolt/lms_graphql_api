require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment_override"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateAssignmentOverride < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :id, ID, required: true
        argument :assignment_override_student_ids, Int, required: false
        argument :assignment_override_title, String, required: false
        argument :assignment_override_due_at, LMSGraphQL::Types::DateTimeType, required: false
        argument :assignment_override_unlock_at, LMSGraphQL::Types::DateTimeType, required: false
        argument :assignment_override_lock_at, LMSGraphQL::Types::DateTimeType, required: false
        field :assignment_override, LMSGraphQL::Types::Canvas::CanvasAssignmentOverride, null: false
        def resolve(course_id:, assignment_id:, id:, assignment_override_student_ids: nil, assignment_override_title: nil, assignment_override_due_at: nil, assignment_override_unlock_at: nil, assignment_override_lock_at: nil)
          context[:canvas_api].call("UPDATE_ASSIGNMENT_OVERRIDE").proxy(
            "UPDATE_ASSIGNMENT_OVERRIDE",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "id": id
            },
            {
              "assignment_override[student_ids]": assignment_override_student_ids,
              "assignment_override[title]": assignment_override_title,
              "assignment_override[due_at]": assignment_override_due_at,
              "assignment_override[unlock_at]": assignment_override_unlock_at,
              "assignment_override[lock_at]": assignment_override_lock_at
            },
          ).parsed_response
        end
      end
    end
  end
end