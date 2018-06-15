require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAllOutcomeGroupsForContextAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasOutcomeGroup], null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].call("GET_ALL_OUTCOME_GROUPS_FOR_CONTEXT_ACCOUNTS").proxy(
            "GET_ALL_OUTCOME_GROUPS_FOR_CONTEXT_ACCOUNTS",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end