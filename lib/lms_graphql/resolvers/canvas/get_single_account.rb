require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasAccount, null: false
        argument :id, ID, required: true
        def resolve(id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_ACCOUNT").proxy(
            "GET_SINGLE_ACCOUNT",
            {
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end