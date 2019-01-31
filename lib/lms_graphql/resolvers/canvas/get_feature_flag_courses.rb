require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/feature_flag"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFeatureFlagCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFeatureFlag, null: false
        argument :course_id, ID, required: true
        argument :feature, String, required: true
        def resolve(course_id:, feature:, get_all: false)
          result = context[:canvas_api].call("GET_FEATURE_FLAG_COURSES").proxy(
            "GET_FEATURE_FLAG_COURSES",
            {
              "course_id": course_id,
              "feature": feature            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end