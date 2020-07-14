require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAvailableTabsForCourseOrGroupCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("LIST_AVAILABLE_TABS_FOR_COURSE_OR_GROUP_COURSES").proxy(
            "LIST_AVAILABLE_TABS_FOR_COURSE_OR_GROUP_COURSES",
            {
              "course_id": course_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end