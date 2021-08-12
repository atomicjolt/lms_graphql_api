require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment_override"
module LMSGraphQL
  module Resolvers
    module Canvas
      class BatchRetrieveOverridesInCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAssignmentOverride], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :assignment_overrides_id, [String], required: true
        argument :assignment_overrides_assignment_id, [String], required: true
        def resolve(course_id:, assignment_overrides_id:, assignment_overrides_assignment_id:, get_all: false)
          result = context[:canvas_api].call("BATCH_RETRIEVE_OVERRIDES_IN_COURSE").proxy(
            "BATCH_RETRIEVE_OVERRIDES_IN_COURSE",
            {
              "course_id": course_id,
              "assignment_overrides[id]": assignment_overrides_id,
              "assignment_overrides[assignment_id]": assignment_overrides_assignment_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end