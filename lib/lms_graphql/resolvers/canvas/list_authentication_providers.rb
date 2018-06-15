require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/authentication_provider"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAuthenticationProvider < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::AuthenticationProvider], null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].proxy(
            "LIST_AUTHENTICATION_PROVIDERS",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end