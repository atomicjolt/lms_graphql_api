require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class SelectProvisionalGrade < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :provisional_grade_id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, assignment_id:, provisional_grade_id:)
          context[:canvas_api].call("SELECT_PROVISIONAL_GRADE").proxy(
            "SELECT_PROVISIONAL_GRADE",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "provisional_grade_id": provisional_grade_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end