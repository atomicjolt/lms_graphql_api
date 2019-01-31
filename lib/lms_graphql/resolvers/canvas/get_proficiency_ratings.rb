require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/proficiency"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetProficiencyRating < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasProficiency, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("GET_PROFICIENCY_RATINGS").proxy(
            "GET_PROFICIENCY_RATINGS",
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