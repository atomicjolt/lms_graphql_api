require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course_nickname"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetCourseNickname < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasCourseNickname, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("GET_COURSE_NICKNAME").proxy(
            "GET_COURSE_NICKNAME",
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