require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/feature_flag"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFeatureFlagUser < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFeatureFlag, null: false
        argument :user_id, ID, required: true
        argument :feature, String, required: true
        def resolve(user_id:, feature:)
          context[:canvas_api].call("GET_FEATURE_FLAG_USERS").proxy(
            "GET_FEATURE_FLAG_USERS",
            {
              "user_id": user_id,
              "feature": feature            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end