require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/proficiency"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetProficiencyRatingsAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasProficiency, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("GET_PROFICIENCY_RATINGS_ACCOUNTS").proxy(
            "GET_PROFICIENCY_RATINGS_ACCOUNTS",
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