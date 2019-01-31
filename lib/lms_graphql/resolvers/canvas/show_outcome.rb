require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowOutcome < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasOutcome, null: false
        argument :id, ID, required: true
        def resolve(id:, get_all: false)
          result = context[:canvas_api].call("SHOW_OUTCOME").proxy(
            "SHOW_OUTCOME",
            {
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