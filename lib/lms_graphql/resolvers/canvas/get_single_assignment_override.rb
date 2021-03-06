require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment_override"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleAssignmentOverride < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasAssignmentOverride, null: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, assignment_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_ASSIGNMENT_OVERRIDE").proxy(
            "GET_SINGLE_ASSIGNMENT_OVERRIDE",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end