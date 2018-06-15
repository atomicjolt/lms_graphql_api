require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/feature_flag"
module LMSGraphQL
  module Mutations
    module Canvas
      class SetFeatureFlagAccount < CanvasBaseMutation
        argument :account_id, ID, required: true
        argument :feature, String, required: true
        argument :state, String, required: false
        field :feature_flag, LMSGraphQL::Types::Canvas::CanvasFeatureFlag, null: false
        def resolve(account_id:, feature:, state: nil)
          ctx[:canvas_api].proxy(
            "SET_FEATURE_FLAG_ACCOUNTS",
            {
              "account_id": account_id,
              "feature": feature,
              "state": state            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end