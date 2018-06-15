require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course_nickname"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListCourseNickname < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCourseNickname], null: false

        def resolve()
          context[:canvas_api].call("LIST_COURSE_NICKNAMES").proxy(
            "LIST_COURSE_NICKNAMES",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end