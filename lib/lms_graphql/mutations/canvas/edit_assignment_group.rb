require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment_group"
module LMSGraphQL
  module Mutations
    module Canvas
      class EditAssignmentGroup < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_group_id, ID, required: true
        field :assignment_group, LMSGraphQL::Types::Canvas::CanvasAssignmentGroup, null: false
        def resolve(course_id:, assignment_group_id:)
          context[:canvas_api].call("EDIT_ASSIGNMENT_GROUP").proxy(
            "EDIT_ASSIGNMENT_GROUP",
            {
              "course_id": course_id,
              "assignment_group_id": assignment_group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end