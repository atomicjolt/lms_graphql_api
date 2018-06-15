require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/rubric"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleRubricCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasRubric, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :include, String, required: false
        argument :style, String, required: false
        def resolve(course_id:, id:, include: nil, style: nil)
          context[:canvas_api].call("GET_SINGLE_RUBRIC_COURSES").proxy(
            "GET_SINGLE_RUBRIC_COURSES",
            {
              "course_id": course_id,
              "id": id,
              "include": include,
              "style": style            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end