require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grading_standard"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleGradingStandardInContextAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasGradingStandard, null: false
        argument :account_id, ID, required: true
        argument :grading_standard_id, ID, required: true
        def resolve(account_id:, grading_standard_id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_GRADING_STANDARD_IN_CONTEXT_ACCOUNTS").proxy(
            "GET_SINGLE_GRADING_STANDARD_IN_CONTEXT_ACCOUNTS",
            {
              "account_id": account_id,
              "grading_standard_id": grading_standard_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end