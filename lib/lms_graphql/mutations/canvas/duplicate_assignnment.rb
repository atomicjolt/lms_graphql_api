require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment"
module LMSGraphQL
  module Mutations
    module Canvas
      class DuplicateAssignnment < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :result_type, String, required: false
        
        
        field :assignment, LMSGraphQL::Types::Canvas::CanvasAssignment, null: false
        
        def resolve(course_id:, assignment_id:, result_type: nil)
          context[:canvas_api].call("DUPLICATE_ASSIGNNMENT").proxy(
            "DUPLICATE_ASSIGNNMENT",
            {
              "course_id": course_id,
              "assignment_id": assignment_id
            },
            {
              "result_type": result_type
            },
          ).parsed_response
        end
      end
    end
  end
end