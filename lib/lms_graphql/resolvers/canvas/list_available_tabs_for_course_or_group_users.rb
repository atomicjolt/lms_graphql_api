require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAvailableTabsForCourseOrGroupUser < CanvasBaseResolver
        type Boolean, null: false
        argument :user_id, ID, required: true
        def resolve(user_id:, get_all: false)
          result = context[:canvas_api].call("LIST_AVAILABLE_TABS_FOR_COURSE_OR_GROUP_USERS").proxy(
            "LIST_AVAILABLE_TABS_FOR_COURSE_OR_GROUP_USERS",
            {
              "user_id": user_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end