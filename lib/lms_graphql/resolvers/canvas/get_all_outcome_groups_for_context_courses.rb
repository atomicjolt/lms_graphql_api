require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAllOutcomeGroupsForContextCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasOutcomeGroup], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].proxy(
            "GET_ALL_OUTCOME_GROUPS_FOR_CONTEXT_COURSES",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end