require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAvailableTabsForCourseOrGroupGroup < CanvasBaseResolver
        type Boolean, null: false
        argument :group_id, ID, required: true
        def resolve(group_id:, get_all: false)
          result = context[:canvas_api].call("LIST_AVAILABLE_TABS_FOR_COURSE_OR_GROUP_GROUPS").proxy(
            "LIST_AVAILABLE_TABS_FOR_COURSE_OR_GROUP_GROUPS",
            {
              "group_id": group_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end