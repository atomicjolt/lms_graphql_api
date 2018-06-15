require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetCourseSetting < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].call("GET_COURSE_SETTINGS").proxy(
            "GET_COURSE_SETTINGS",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end