require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListEnabledFeaturesAccount < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].call("LIST_ENABLED_FEATURES_ACCOUNTS").proxy(
            "LIST_ENABLED_FEATURES_ACCOUNTS",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end