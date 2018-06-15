require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/collaboration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListCollaborationsCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCollaboration], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].call("LIST_COLLABORATIONS_COURSES").proxy(
            "LIST_COLLABORATIONS_COURSES",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end