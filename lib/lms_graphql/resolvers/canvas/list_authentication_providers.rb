require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/authentication_provider"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAuthenticationProvider < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAuthenticationProvider], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("LIST_AUTHENTICATION_PROVIDERS").proxy(
            "LIST_AUTHENTICATION_PROVIDERS",
            {
              "account_id": account_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end