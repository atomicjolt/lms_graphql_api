require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleCourseCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasCourse, null: false
        argument :id, ID, required: true
        argument :include, String, required: false
        argument :teacher_limit, Int, required: false
        def resolve(id:, include: nil, teacher_limit: nil)
          context[:canvas_api].call("GET_SINGLE_COURSE_COURSES").proxy(
            "GET_SINGLE_COURSE_COURSES",
            {
              "id": id,
              "include": include,
              "teacher_limit": teacher_limit            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end