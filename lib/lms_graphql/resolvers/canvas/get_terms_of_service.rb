require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetTermsOfService < CanvasBaseResolver
        type String, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].call("GET_TERMS_OF_SERVICE").proxy(
            "GET_TERMS_OF_SERVICE",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end