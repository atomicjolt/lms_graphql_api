require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class SelectMasteryPath < BaseMutation
        argument :course_id, ID, required: true
        argument :module_id, ID, required: true
        argument :id, ID, required: true
        argument :assignment_set_id, ID, required: false
        argument :student_id, ID, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, module_id:, id:, assignment_set_id: nil, student_id: nil)
          context[:canvas_api].call("SELECT_MASTERY_PATH").proxy(
            "SELECT_MASTERY_PATH",
            {
              "course_id": course_id,
              "module_id": module_id,
              "id": id
            },
            {
              "assignment_set_id": assignment_set_id,
              "student_id": student_id
            },
          ).parsed_response
        end
      end
    end
  end
end