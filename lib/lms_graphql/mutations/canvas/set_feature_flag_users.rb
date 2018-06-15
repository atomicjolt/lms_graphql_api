require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/feature_flag"
module LMSGraphQL
  module Mutations
    module Canvas
      class SetFeatureFlagUser < BaseMutation
        argument :user_id, ID, required: true
        argument :feature, String, required: true
        argument :state, String, required: false
        field :feature_flag, LMSGraphQL::Types::Canvas::CanvasFeatureFlag, null: false
        def resolve(user_id:, feature:, state: nil)
          context[:canvas_api].call("SET_FEATURE_FLAG_USERS").proxy(
            "SET_FEATURE_FLAG_USERS",
            {
              "user_id": user_id,
              "feature": feature,
              "state": state            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end