require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/role"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListRole < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasRole], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :state, [String], required: false
        argument :show_inherited, Boolean, required: false
        def resolve(account_id:, state: nil, show_inherited: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ROLES").proxy(
            "LIST_ROLES",
            {
              "account_id": account_id,
              "state": state,
              "show_inherited": show_inherited            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end