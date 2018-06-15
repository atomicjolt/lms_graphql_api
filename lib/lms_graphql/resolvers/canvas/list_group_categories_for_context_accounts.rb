require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_category"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupCategoriesForContextAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::GroupCategory], null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].proxy(
            "LIST_GROUP_CATEGORIES_FOR_CONTEXT_ACCOUNTS",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end