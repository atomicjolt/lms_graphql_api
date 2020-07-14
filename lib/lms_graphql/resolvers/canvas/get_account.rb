require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasAccount, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("GET_ACCOUNT").proxy(
            "GET_ACCOUNT",
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