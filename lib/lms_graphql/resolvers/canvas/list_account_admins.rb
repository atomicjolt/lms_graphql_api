require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/admin"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAccountAdmin < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAdmin], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :user_id, [Int], required: false
        def resolve(account_id:, user_id: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ACCOUNT_ADMINS").proxy(
            "LIST_ACCOUNT_ADMINS",
            {
              "account_id": account_id,
              "user_id": user_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end