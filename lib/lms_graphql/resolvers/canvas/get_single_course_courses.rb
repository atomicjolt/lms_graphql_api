require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleCourseCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasCourse, null: false
        argument :id, ID, required: true
        argument :include, String, required: false
        def resolve(id:, include: nil)
          context[:canvas_api].proxy(
            "GET_SINGLE_COURSE_COURSES",
            {
              "id": id,
              "include": include            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end