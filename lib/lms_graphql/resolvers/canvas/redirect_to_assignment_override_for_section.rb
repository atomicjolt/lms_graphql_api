require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class RedirectToAssignmentOverrideForSection < CanvasBaseResolver
        type Boolean, null: false
        argument :course_section_id, ID, required: true
        argument :assignment_id, ID, required: true
        def resolve(course_section_id:, assignment_id:, get_all: false)
          result = context[:canvas_api].call("REDIRECT_TO_ASSIGNMENT_OVERRIDE_FOR_SECTION").proxy(
            "REDIRECT_TO_ASSIGNMENT_OVERRIDE_FOR_SECTION",
            {
              "course_section_id": course_section_id,
              "assignment_id": assignment_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end