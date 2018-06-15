require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListStudentsSelectedForModeration < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasUser], null: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        def resolve(course_id:, assignment_id:)
          context[:canvas_api].call("LIST_STUDENTS_SELECTED_FOR_MODERATION").proxy(
            "LIST_STUDENTS_SELECTED_FOR_MODERATION",
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