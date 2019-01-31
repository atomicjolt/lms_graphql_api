require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupsAvailableInContextAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroup], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :only_own_groups, Boolean, required: false
        argument :include, String, required: false
        def resolve(account_id:, only_own_groups: nil, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_GROUPS_AVAILABLE_IN_CONTEXT_ACCOUNTS").proxy(
            "LIST_GROUPS_AVAILABLE_IN_CONTEXT_ACCOUNTS",
            {
              "account_id": account_id,
              "only_own_groups": only_own_groups,
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