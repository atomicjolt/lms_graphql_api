require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment_override"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteAssignmentOverride < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :assignment_override, LMSGraphQL::Types::Canvas::CanvasAssignmentOverride, null: false
        
        def resolve(course_id:, assignment_id:, id:)
          context[:canvas_api].call("DELETE_ASSIGNMENT_OVERRIDE").proxy(
            "DELETE_ASSIGNMENT_OVERRIDE",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end