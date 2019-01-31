require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user_display"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGradeableStudent < CanvasBaseResolver
        type [UserDisplay], null: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        def resolve(course_id:, assignment_id:)
          context[:canvas_api].call("LIST_GRADEABLE_STUDENTS").proxy(
            "LIST_GRADEABLE_STUDENTS",
            {
              "course_id": course_id,
              "assignment_id": assignment_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end