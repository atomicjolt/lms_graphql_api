require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowOutcome < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::Outcome, null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].proxy(
            "SHOW_OUTCOME",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end