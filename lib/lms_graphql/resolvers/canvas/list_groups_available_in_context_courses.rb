require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupsAvailableInContextCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroup], null: false
        argument :course_id, ID, required: true
        argument :only_own_groups, Boolean, required: false
        argument :include, String, required: false
        def resolve(course_id:, only_own_groups: nil, include: nil)
          context[:canvas_api].proxy(
            "LIST_GROUPS_AVAILABLE_IN_CONTEXT_COURSES",
            {
              "course_id": course_id,
              "only_own_groups": only_own_groups,
              "include": include            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end