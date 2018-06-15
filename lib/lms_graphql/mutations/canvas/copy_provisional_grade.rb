require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/provisional_grade"
module LMSGraphQL
  module Mutations
    module Canvas
      class CopyProvisionalGrade < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :provisional_grade_id, ID, required: true
        field :provisional_grade, LMSGraphQL::Types::Canvas::CanvasProvisionalGrade, null: false
        def resolve(course_id:, assignment_id:, provisional_grade_id:)
          context[:canvas_api].call("COPY_PROVISIONAL_GRADE").proxy(
            "COPY_PROVISIONAL_GRADE",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "provisional_grade_id": provisional_grade_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end