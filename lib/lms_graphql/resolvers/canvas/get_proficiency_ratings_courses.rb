require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/proficiency"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetProficiencyRatingsCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasProficiency, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("GET_PROFICIENCY_RATINGS_COURSES").proxy(
            "GET_PROFICIENCY_RATINGS_COURSES",
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