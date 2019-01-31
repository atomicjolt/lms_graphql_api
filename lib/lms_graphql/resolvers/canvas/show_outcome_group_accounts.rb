require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowOutcomeGroupAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasOutcomeGroup, null: false
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        def resolve(account_id:, id:, get_all: false)
          result = context[:canvas_api].call("SHOW_OUTCOME_GROUP_ACCOUNTS").proxy(
            "SHOW_OUTCOME_GROUP_ACCOUNTS",
            {
              "account_id": account_id,
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