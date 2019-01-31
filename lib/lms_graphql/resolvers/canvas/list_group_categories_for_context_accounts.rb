require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_category"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupCategoriesForContextAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroupCategory], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("LIST_GROUP_CATEGORIES_FOR_CONTEXT_ACCOUNTS").proxy(
            "LIST_GROUP_CATEGORIES_FOR_CONTEXT_ACCOUNTS",
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