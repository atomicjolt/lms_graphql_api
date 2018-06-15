require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class RedirectToAssignmentOverrideForGroup < CanvasBaseResolver
        type Boolean, null: false
        argument :group_id, ID, required: true
        argument :assignment_id, ID, required: true
        def resolve(group_id:, assignment_id:)
          context[:canvas_api].call("REDIRECT_TO_ASSIGNMENT_OVERRIDE_FOR_GROUP").proxy(
            "REDIRECT_TO_ASSIGNMENT_OVERRIDE_FOR_GROUP",
            {
              "group_id": group_id,
              "assignment_id": assignment_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end