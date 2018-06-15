require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListSubgroupsAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::OutcomeGroup], null: false
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        def resolve(account_id:, id:)
          context[:canvas_api].proxy(
            "LIST_SUBGROUPS_ACCOUNTS",
            {
              "account_id": account_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end