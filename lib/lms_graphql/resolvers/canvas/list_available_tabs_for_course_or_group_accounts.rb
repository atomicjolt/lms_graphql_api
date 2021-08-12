require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAvailableTabsForCourseOrGroupAccount < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: true
        argument :include, [String], required: false
        def resolve(account_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_AVAILABLE_TABS_FOR_COURSE_OR_GROUP_ACCOUNTS").proxy(
            "LIST_AVAILABLE_TABS_FOR_COURSE_OR_GROUP_ACCOUNTS",
            {
              "account_id": account_id,
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