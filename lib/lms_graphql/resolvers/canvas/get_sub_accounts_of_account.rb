require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSubAccountsOfAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAccount], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :recursive, Boolean, required: false
        def resolve(account_id:, recursive: nil, get_all: false)
          result = context[:canvas_api].call("GET_SUB_ACCOUNTS_OF_ACCOUNT").proxy(
            "GET_SUB_ACCOUNTS_OF_ACCOUNT",
            {
              "account_id": account_id,
              "recursive": recursive            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end