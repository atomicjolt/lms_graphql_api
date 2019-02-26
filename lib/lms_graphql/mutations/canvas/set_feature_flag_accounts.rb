require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/feature_flag"
module LMSGraphQL
  module Mutations
    module Canvas
      class SetFeatureFlagAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :feature, String, required: true
        argument :state, String, required: false
        field :feature_flag, LMSGraphQL::Types::Canvas::CanvasFeatureFlag, null: false
        def resolve(account_id:, feature:, state: nil)
          context[:canvas_api].call("SET_FEATURE_FLAG_ACCOUNTS").proxy(
            "SET_FEATURE_FLAG_ACCOUNTS",
            {
              "account_id": account_id,
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