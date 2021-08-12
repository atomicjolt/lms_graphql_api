require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class SetExtensionsForStudentAssignmentSubmission < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :assignment_extensions_user_id, [Int], required: true
        argument :assignment_extensions_extra_attempts, [Int], required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, assignment_id:, assignment_extensions_user_id:, assignment_extensions_extra_attempts:)
          context[:canvas_api].call("SET_EXTENSIONS_FOR_STUDENT_ASSIGNMENT_SUBMISSIONS").proxy(
            "SET_EXTENSIONS_FOR_STUDENT_ASSIGNMENT_SUBMISSIONS",
            {
              "course_id": course_id,
              "assignment_id": assignment_id
            },
            {
              "assignment_extensions[user_id]": assignment_extensions_user_id,
              "assignment_extensions[extra_attempts]": assignment_extensions_extra_attempts
            },
          ).parsed_response
        end
      end
    end
  end
end