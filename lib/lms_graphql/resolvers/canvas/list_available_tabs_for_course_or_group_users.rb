require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAvailableTabsForCourseOrGroupUser < CanvasBaseResolver
        type Boolean, null: false
        argument :user_id, ID, required: true
        argument :include, [String], required: false
        def resolve(user_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_AVAILABLE_TABS_FOR_COURSE_OR_GROUP_USERS").proxy(
            "LIST_AVAILABLE_TABS_FOR_COURSE_OR_GROUP_USERS",
            {
              "user_id": user_id,
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