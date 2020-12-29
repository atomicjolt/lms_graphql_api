require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/feature_flag"
module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveFeatureFlagCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :feature, String, required: true
        
        
        field :feature_flag, LMSGraphQL::Types::Canvas::CanvasFeatureFlag, null: false
        
        def resolve(course_id:, feature:)
          context[:canvas_api].call("REMOVE_FEATURE_FLAG_COURSES").proxy(
            "REMOVE_FEATURE_FLAG_COURSES",
            {
              "course_id": course_id,
              "feature": feature
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end