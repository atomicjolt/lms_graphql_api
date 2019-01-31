require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course_nickname"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListCourseNickname < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCourseNickname], null: false
        argument :get_all, Boolean, required: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("LIST_COURSE_NICKNAMES").proxy(
            "LIST_COURSE_NICKNAMES",
            {
            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end