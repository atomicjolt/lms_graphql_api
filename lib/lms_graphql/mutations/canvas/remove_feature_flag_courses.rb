require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/feature_flag"
module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveFeatureFlagCourse < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :feature, String, required: true
        field :feature_flag, LMSGraphQL::Types::Canvas::CanvasFeatureFlag, null: false
        def resolve(course_id:, feature:)
          ctx[:canvas_api].proxy(
            "REMOVE_FEATURE_FLAG_COURSES",
            {
              "course_id": course_id,
              "feature": feature            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end