require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment_override"
module LMSGraphQL
  module Mutations
    module Canvas
      class BatchUpdateOverridesInCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_overrides, [LMSGraphQL::Types::Canvas::CanvasAssignmentOverrideInput], required: true
        field :assignment_override, [LMSGraphQL::Types::Canvas::CanvasAssignmentOverride], null: false
        def resolve(course_id:, assignment_overrides:)
          context[:canvas_api].call("BATCH_UPDATE_OVERRIDES_IN_COURSE").proxy(
            "BATCH_UPDATE_OVERRIDES_IN_COURSE",
            {
              "course_id": course_id,
              "assignment_overrides": assignment_overrides            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end