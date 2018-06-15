require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Mutations
    module Canvas
      class SelectStudentsForModeration < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :student_ids, [ID], required: false
        field :user, [LMSGraphQL::Types::Canvas::CanvasUser], null: false
        def resolve(course_id:, assignment_id:, student_ids: nil)
          context[:canvas_api].call("SELECT_STUDENTS_FOR_MODERATION").proxy(
            "SELECT_STUDENTS_FOR_MODERATION",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "student_ids": student_ids            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end