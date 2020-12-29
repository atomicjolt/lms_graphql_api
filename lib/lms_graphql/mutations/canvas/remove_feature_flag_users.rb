require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/feature_flag"
module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveFeatureFlagUser < BaseMutation
        argument :user_id, ID, required: true
        argument :feature, String, required: true
        
        
        field :feature_flag, LMSGraphQL::Types::Canvas::CanvasFeatureFlag, null: false
        
        def resolve(user_id:, feature:)
          context[:canvas_api].call("REMOVE_FEATURE_FLAG_USERS").proxy(
            "REMOVE_FEATURE_FLAG_USERS",
            {
              "user_id": user_id,
              "feature": feature
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end