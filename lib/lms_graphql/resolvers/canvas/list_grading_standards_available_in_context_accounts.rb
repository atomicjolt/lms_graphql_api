require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grading_standard"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGradingStandardsAvailableInContextAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGradingStandard], null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].call("LIST_GRADING_STANDARDS_AVAILABLE_IN_CONTEXT_ACCOUNTS").proxy(
            "LIST_GRADING_STANDARDS_AVAILABLE_IN_CONTEXT_ACCOUNTS",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end