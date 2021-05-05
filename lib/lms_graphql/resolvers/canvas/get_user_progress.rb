require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course_progress"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetUserProgress < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasCourseProgress, null: false
        argument :course_id, ID, required: true
        argument :user_id, ID, required: true
        def resolve(course_id:, user_id:, get_all: false)
          result = context[:canvas_api].call("GET_USER_PROGRESS").proxy(
            "GET_USER_PROGRESS",
            {
              "course_id": course_id,
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