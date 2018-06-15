require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grading_standard"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleGradingStandardInContextAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::GradingStandard, null: false
        argument :account_id, ID, required: true
        argument :grading_standard_id, ID, required: true
        def resolve(account_id:, grading_standard_id:)
          context[:canvas_api].proxy(
            "GET_SINGLE_GRADING_STANDARD_IN_CONTEXT_ACCOUNTS",
            {
              "account_id": account_id,
              "grading_standard_id": grading_standard_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end