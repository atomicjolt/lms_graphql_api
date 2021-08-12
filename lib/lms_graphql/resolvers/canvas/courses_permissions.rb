require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class CoursesPermission < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :permissions, [String], required: false
        def resolve(course_id:, permissions: nil, get_all: false)
          result = context[:canvas_api].call("COURSES_PERMISSIONS").proxy(
            "COURSES_PERMISSIONS",
            {
              "course_id": course_id,
              "permissions": permissions            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end