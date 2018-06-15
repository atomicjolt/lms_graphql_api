require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ResolvePathCoursesFullPath < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasFolder], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].proxy(
            "RESOLVE_PATH_COURSES_FULL_PATH",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end