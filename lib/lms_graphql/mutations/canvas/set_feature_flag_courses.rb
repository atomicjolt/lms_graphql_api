require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/feature_flag"
module LMSGraphQL
  module Mutations
    module Canvas
      class SetFeatureFlagCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :feature, String, required: true
        argument :state, String, required: false
        
        
        field :feature_flag, LMSGraphQL::Types::Canvas::CanvasFeatureFlag, null: false
        
        def resolve(course_id:, feature:, state: nil)
          context[:canvas_api].call("SET_FEATURE_FLAG_COURSES").proxy(
            "SET_FEATURE_FLAG_COURSES",
            {
              "course_id": course_id,
              "feature": feature
            },
            {
              "state": state
            },
          ).parsed_response
        end
      end
    end
  end
end