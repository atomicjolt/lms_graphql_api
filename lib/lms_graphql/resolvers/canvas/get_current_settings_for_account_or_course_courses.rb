require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetCurrentSettingsForAccountOrCourseCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("GET_CURRENT_SETTINGS_FOR_ACCOUNT_OR_COURSE_COURSES").proxy(
            "GET_CURRENT_SETTINGS_FOR_ACCOUNT_OR_COURSE_COURSES",
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