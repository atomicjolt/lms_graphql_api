require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupsAvailableInContextCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroup], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :only_own_groups, Boolean, required: false
        argument :include, [String], required: false
        def resolve(course_id:, only_own_groups: nil, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_GROUPS_AVAILABLE_IN_CONTEXT_COURSES").proxy(
            "LIST_GROUPS_AVAILABLE_IN_CONTEXT_COURSES",
            {
              "course_id": course_id,
              "only_own_groups": only_own_groups,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end