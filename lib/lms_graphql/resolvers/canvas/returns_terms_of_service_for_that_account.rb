require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ReturnsTermsOfServiceForThatAccount < CanvasBaseResolver
        type String, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].call("RETURNS_TERMS_OF_SERVICE_FOR_THAT_ACCOUNT").proxy(
            "RETURNS_TERMS_OF_SERVICE_FOR_THAT_ACCOUNT",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end