require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListCourseSection < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasSection], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :include, [String], required: false
        def resolve(course_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_COURSE_SECTIONS").proxy(
            "LIST_COURSE_SECTIONS",
            {
              "course_id": course_id,
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