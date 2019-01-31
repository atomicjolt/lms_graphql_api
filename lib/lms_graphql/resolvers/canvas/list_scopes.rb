require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/scope"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListScope < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasScope], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :group_by, String, required: false
        def resolve(account_id:, group_by: nil, get_all: false)
          result = context[:canvas_api].call("LIST_SCOPES").proxy(
            "LIST_SCOPES",
            {
              "account_id": account_id,
              "group_by": group_by            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end