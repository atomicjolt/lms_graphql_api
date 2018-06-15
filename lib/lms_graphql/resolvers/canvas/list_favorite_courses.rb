require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListFavoriteCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCourse], null: false
        argument :exclude_blueprint_courses, Boolean, required: false
        def resolve(exclude_blueprint_courses: nil)
          context[:canvas_api].call("LIST_FAVORITE_COURSES").proxy(
            "LIST_FAVORITE_COURSES",
            {
              "exclude_blueprint_courses": exclude_blueprint_courses            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end