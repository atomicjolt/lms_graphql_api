require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAccountsThatAdminsCanManage < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAccount], null: false
        argument :get_all, Boolean, required: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("GET_ACCOUNTS_THAT_ADMINS_CAN_MANAGE").proxy(
            "GET_ACCOUNTS_THAT_ADMINS_CAN_MANAGE",
            {
            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end