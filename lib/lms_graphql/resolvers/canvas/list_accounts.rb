require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAccount], null: false
        argument :get_all, Boolean, required: false
        argument :include, [String], required: false
        def resolve(include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ACCOUNTS").proxy(
            "LIST_ACCOUNTS",
            {
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end